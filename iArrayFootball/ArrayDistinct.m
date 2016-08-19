//
//  ArrayDistinct.m
//  iArrayFootball
//
//  Created by Bui Duc Khanh on 8/19/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "ArrayDistinct.h"
#import <QuartzCore/QuartzCore.h>
#import "NSArray+ExtendNSArray.h"

@implementation ArrayDistinct
{
    UITextField *txtSource;
    UILabel *lblResult;
    
    float viewportWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Khởi tạo giao diện 1 chút
    self.title = @"Array Distinct";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    viewportWidth = self.view.frame.size.width;
    
    [self buildGUI];
    
    [self getDistinct];
}

- (void) buildGUI{
    // Label chỉ dẫn đầu vào
    UILabel *lblSource = [UILabel new];
    lblSource.frame =CGRectMake(5, 10, viewportWidth - 10, 25);
    lblSource.textAlignment = NSTextAlignmentLeft;
    lblSource.text = @"Điền mảng các phần tử phân cách bằng dấu ,";
    [lblSource setTextColor:[UIColor blackColor]];
    [lblSource setFont:[UIFont systemFontOfSize:17]];
    
    [self.view addSubview:lblSource];
    
    
    // Text field nhận đầu vào
    txtSource = [UITextField new];
    txtSource.frame =CGRectMake(5, 40, viewportWidth - 10, 40);
    [txtSource setTextColor:[UIColor blackColor]];
    txtSource.layer.borderColor=[UIColor brownColor].CGColor;
    
    [txtSource setFont:[UIFont systemFontOfSize:20]];
    
    txtSource.layer.borderWidth=2.0;
    [txtSource setText:@"1,1,3,3,9,5,8,8,2,9,4"];
    
    [self.view addSubview:txtSource];
    
    
    // Nút Tính kết quả
    UIButton *btnDistinct = [UIButton new];
    btnDistinct.frame =CGRectMake(5, 100, 100, 25);
    [btnDistinct setTitle:@"Tính Kết Quả" forState:UIControlStateNormal];
    [btnDistinct setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnDistinct.titleLabel setFont:[UIFont systemFontOfSize:17]];
    
    [self.view addSubview:btnDistinct];
    
    [btnDistinct addTarget:self action:@selector(getDistinct) forControlEvents:UIControlEventTouchUpInside];
    

    // Label kết quả
    lblResult = [UILabel new];
    lblResult.frame =CGRectMake(5, 150, viewportWidth - 10, 25);
    lblResult.textAlignment = NSTextAlignmentLeft;
    [lblResult setTextColor:[UIColor blueColor]];
    [lblResult setFont:[UIFont systemFontOfSize:17]];
    
    [self.view addSubview:lblResult];
}

- (void) getDistinct
{
    if (txtSource.text.length == 0)
        return;
    
    NSArray *data = [txtSource.text componentsSeparatedByString:@","];
    
    NSArray *result = [NSArray distinct:data];
    
    NSString *tmp;
    
    if (result.count > 0)
        tmp = [NSString stringWithFormat:@"%@", result[0]];

    for (int i = 1; i < result.count; i++)
        tmp = [NSString stringWithFormat:@"%@,%@", tmp, result[i]];
    
    lblResult.text = tmp;
}

@end
