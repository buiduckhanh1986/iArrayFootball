//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* hw = @{SECTION: @"NSArray truy vấn có HW", MENU: @[
                                    @{TITLE: @"HW 1 (Chọn đội hình)", CLASS: @"TeamChooser"},
                                    @{TITLE: @"HW 2 (Các phần tử duy nhất)", CLASS: @"ArrayDistinct"}
                          ]};
    
    mainScreen.menu = @[hw];
    mainScreen.title = @"Lập trình với tập hợp";
    mainScreen.about = @"Các HW lập trình với tập hợp";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
