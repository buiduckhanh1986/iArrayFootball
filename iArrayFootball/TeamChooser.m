//
//  TeamChooser.m
//  iArrayFootball
//
//  Created by Bui Duc Khanh on 8/19/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "TeamChooser.h"

@implementation TeamChooser
{
    NSArray * data;
    
    NSMutableArray * teamPlayerLabel;
    
    float viewportWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Khởi tạo giao diện 1 chút
    self.title = @"Barcelona";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    viewportWidth = self.view.frame.size.width;
    
    data = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Barcelona" ofType:@"plist"]];
    
    [self buildGUI];
    
    [self chooseTeam];
}


- (void) buildGUI{
    // Tạo 1 nút chọn đội hình
    UIButton *btnChoose = [UIButton new];
    btnChoose.frame =CGRectMake(viewportWidth/2.0 - 80, 0, 160, 50);
    [btnChoose setTitle:@"Chọn Đội Hình" forState:UIControlStateNormal];
    [btnChoose setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnChoose.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    
    [btnChoose addTarget:self action:@selector(chooseTeam) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnChoose];
    
    // Tạo 2 label đánh dấu đội hình chính và đội hình thi đấu
    UILabel *lblTeam = [UILabel new];
    lblTeam.frame =CGRectMake(0, 50, viewportWidth/2.0, 50);
    lblTeam.textAlignment = NSTextAlignmentCenter;
    lblTeam.text = @"Đội bóng";
    [lblTeam setTextColor:[UIColor blackColor]];
    [lblTeam setFont:[UIFont systemFontOfSize:23]];
    
    [self.view addSubview:lblTeam];
    
    
    UILabel *lblPlayers = [UILabel new];
    lblPlayers.frame =CGRectMake(viewportWidth/2.0, 50, viewportWidth/2.0, 50);
    lblPlayers.textAlignment = NSTextAlignmentCenter;
    lblPlayers.text = @"Đội hình thi đấu";
    [lblPlayers setTextColor:[UIColor blackColor]];
    [lblPlayers setFont:[UIFont systemFontOfSize:23]];
    
    [self.view addSubview:lblPlayers];
    
    float y = 100;
    float h = 20;
    // Hiển thị toàn đội
    for(int i = 0; i < data.count; i++)
    {
        
        UILabel *lblPlayer = [UILabel new];
        lblPlayer.frame =CGRectMake(0, y + i * h , viewportWidth/2.0, h);
        lblPlayer.textAlignment = NSTextAlignmentLeft;
        lblPlayer.text = [NSString stringWithFormat:@"   %3u  %@   %@", [((NSNumber*)data[i][@"number"]) intValue], data[i][@"position"], data[i][@"name"] ] ;
        [lblPlayer setTextColor:[UIColor blackColor]];
        [lblPlayer setFont:[UIFont systemFontOfSize:17]];
        
        [self.view addSubview:lblPlayer];
    }
}

// Hàm chọn team
- (void) chooseTeam{
    NSMutableArray * gk = [NSMutableArray new];
    NSMutableArray * players = [NSMutableArray new];
    
    
    for(int i = 0; i < data.count; i++)
    {
        if ([data[i][@"position"] isEqual:@"GK"]) // Nếu là thủ môn
        {
            [gk addObject:data[i]];
        }
        else // Nếu là cầu thủ
        {
            [players addObject:data[i]];
        }
    }
    
    // Tạo mảng đội hình thi đấu
    NSMutableArray * team = [NSMutableArray new];
    
    // Chọn ngẫu nhiên thủ môn
    [team addObject:gk[arc4random_uniform(gk.count)]];
    
    // Chọn ngẫu nhiên 10 cầu thủ khác
    for (int i = 0; i < 10; i++)
    {
        int index = arc4random_uniform(players.count);
        
        [team addObject:players[index]];
        [players removeObjectAtIndex:index];
    }
    
    
    // Xoá label đội hình cũ nếu có
    if (teamPlayerLabel == nil)
        teamPlayerLabel = [NSMutableArray new];
    else
        for (int i = 0; i < teamPlayerLabel.count; i++)
        {
            UILabel *lbl = teamPlayerLabel[i];
            
            [lbl removeFromSuperview];
            [teamPlayerLabel removeObjectAtIndex:i];
            i--;
        }
    
    
    float y = 100;
    float h = 20;
    // Hiển thị đội hình thi đấu
    for(int i = 0; i < team.count; i++)
    {
        
        UILabel *lblPlayer = [UILabel new];
        lblPlayer.frame =CGRectMake(viewportWidth/2.0, y + i * h , viewportWidth/2.0, h);
        lblPlayer.textAlignment = NSTextAlignmentLeft;
        lblPlayer.text = [NSString stringWithFormat:@"   %3u  %@   %@", [((NSNumber*)team[i][@"number"]) intValue], team[i][@"position"], team[i][@"name"] ] ;
        [lblPlayer setTextColor:[UIColor blackColor]];
        [lblPlayer setFont:[UIFont systemFontOfSize:17]];
        
        [self.view addSubview:lblPlayer];
        
        [teamPlayerLabel addObject:lblPlayer];
    }
}


@end
