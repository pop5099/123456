//
//  FriendTrendsViewController.m
//  百思不得姐
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "FriendTrendsViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "RecommendViewController.h"
#import "LoginViewController.h"
@interface FriendTrendsViewController ()

@end

@implementation FriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor orangeColor];
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" highImageName:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    // 设置背景色
    self.view.backgroundColor = BACCOLOR;
}

- (void)friendsClick
{
    RecommendViewController * recommendVC=[[RecommendViewController alloc]init];
    [self.navigationController pushViewController:recommendVC animated:YES];
}
- (IBAction)loginAction:(id)sender {
    LoginViewController * vc=[[LoginViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)registerAction:(id)sender {
    LoginViewController * vc=[[LoginViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    [vc.lognRegiss setSelected:YES];
    vc.loginMargin.constant = - self.view.width;

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
