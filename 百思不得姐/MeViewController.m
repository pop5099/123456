//
//  MeViewController.m
//  百思不得姐
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "MeViewController.h"
#import "UIBarButtonItem+Extension.h"
@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = BACCOLOR;
    // 设置导航栏标题
    self.navigationItem.title = @"我的";
    
    // 设置导航栏右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImageName:@"mine-setting-icon" highImageName:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImageName:@"mine-moon-icon" highImageName:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}
-(void)settingClick{
    
}
-(void)moonClick{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
