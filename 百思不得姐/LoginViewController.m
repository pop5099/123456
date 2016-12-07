//
//  LoginViewController.m
//  百思不得姐
//
//  Created by mac on 16/10/8.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "LoginViewController.h"
#import "UITextField+Placeholder.h"
#import "MytextFile.h"
@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *phoneTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.phoneTF.placeLableColor=[UIColor whiteColor];
//    self.passwordTF.placeLableColor=[UIColor whiteColor];
    
    
    //富文本
//    NSMutableDictionary * dic=[NSMutableDictionary dictionary];
//    dic[NSForegroundColorAttributeName]=[UIColor grayColor];
//    //带有属性的文字
//    NSAttributedString * placeholder=[[NSAttributedString alloc]initWithString:@"手机号" attributes:dic];
//    self.phoneTF.attributedPlaceholder=placeholder;
//    
//    NSMutableAttributedString * placeH=[[NSMutableAttributedString alloc]initWithString:@"密码"];
//    [placeH setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(0, 1)];
//    self.passwordTF.attributedPlaceholder=placeH;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)exitAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)loginRegisAction:(UIButton *)button {
    // 退出键盘
    [self.view endEditing:YES];
    
    if (self.loginMargin.constant == 0) { // 显示注册界面
        self.loginMargin.constant = - self.view.width;
        button.selected = YES;
    } else { // 显示登录界面
        self.loginMargin.constant = 0;
        button.selected = NO;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}
//让当前控制器对应的控制栏白色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
