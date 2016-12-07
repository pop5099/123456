//
//  TabBarController.m
//  百思不得姐
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "FriendTrendsViewController.h"
#import "MeViewController.h"
#import "TabBar.h"
@interface TabBarController ()

@end

@implementation TabBarController
//第一次使用这个类调用的方法
+(void)initialize{
    //设置文字的颜色
    //    NSMutableDictionary * dic1 =[NSMutableDictionary dictionary];
    //    dic1[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    //    dic1[NSForegroundColorAttributeName]=[UIColor grayColor];
    //
    //    NSMutableDictionary * dic2 =[NSMutableDictionary dictionary];
    //    dic2[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    //    dic2[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    //
    //    UITabBarItem * item=[UITabBarItem appearance];
    //    [item setTitleTextAttributes:dic1 forState:UIControlStateNormal];
    //    [item setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [appearance setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self setupChildVC:[[EssenceViewController alloc]init] title:@"精华" image:@"tabBar_essence_icon"  selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVC:[[NewViewController alloc]init] title:@"最新" image:@"tabBar_new_icon"  selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVC:[[FriendTrendsViewController alloc]init] title:@"关注" image:@"tabBar_friendTrends_icon"  selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildVC:[[MeViewController alloc]init] title:@"我" image:@"tabBar_me_icon"  selectedImage:@"tabBar_me_click_icon"];
    
    //更换tabBar
    [self setValue:[[TabBar alloc]init] forKey:@"tabBar"];
}
//1.初始化控制器
-(void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //设置文字图片
    vc.tabBarItem.title=title;
    vc.tabBarItem.image=[UIImage imageNamed:image];
    vc.tabBarItem.selectedImage=[UIImage imageNamed:selectedImage];
    //添加一个导航控制器为TabBarController的子视图控制器
    NavigationController * naiVC=[[NavigationController alloc]initWithRootViewController:vc];
    //一下addChildViewController，一个ViewController可以添加多个子ViewController，但是这 些子ViewController只有一个是显示到父视图中的
    [self addChildViewController:naiVC];
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
