//
//  PublishViewController.m
//  百思不得姐
//
//  Created by 许东晓 on 2016/10/12.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "PublishViewController.h"
#import "MyButton.h"

@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //添加title
    UIImageView * titleImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    titleImage.Y=kScreenHeight /5;
    titleImage.centerX=kScreenWidth/2;
    [self.view addSubview:titleImage];
    
    
    CGFloat buttonW= 72;
    CGFloat buttonH= 71+30;
    NSArray * imageArray =@[@"publish-video",@"publish-picture",@"publish-text",@"publish-audio",@"publish-review",@"publish-offline"];
    NSArray * titleArray =@[@"发视频",@"发图片",@"发段子",@"发声音",@"审帖",@"发链接"];
    for (int i =0 ; i<6; i++) {
        MyButton * button =[[MyButton alloc]init];
        button.width=buttonW;
        button.height=buttonH;
        CGFloat buttonStarY=(kScreenHeight - 2 * buttonH)/2;
        CGFloat buttonStarX=(kScreenWidth - 3 * buttonW) /4;
        int row = i /3 ;
        int col =i% 3;
        
        button.X=buttonStarX + col*(buttonW+buttonStarX);
        button.Y=buttonStarY + row*buttonH;
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
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
