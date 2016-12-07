//
//  ShowPicViewController.m
//  百思不得姐
//
//  Created by mac on 16/10/11.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "ShowPicViewController.h"
#import "CrossModel.h"
#import <DALabeledCircularProgressView.h>
@interface ShowPicViewController ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *commentButton;
@property (strong, nonatomic) IBOutlet UIButton *transpondButton;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet DALabeledCircularProgressView *progsView;


@end

@implementation ShowPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImageView * imageView=[[UIImageView alloc]init];
    imageView.userInteractionEnabled=YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(exit)]];

    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    CGFloat screenH=[UIScreen mainScreen].bounds.size.height;
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    
    
    CGFloat imageW= screenW;
    CGFloat imageH= imageW * self.model.height / self.model.width;
    
    if (imageH > screenH) {
        //可以滑动
        imageView.frame=CGRectMake(0, 0, imageW, imageH);
        self.scrollView.contentSize=CGSizeMake(screenW, imageH);
    }else{
        imageView.size=CGSizeMake(imageW, imageH);
        imageView.centerY=screenH * 0.5;
//        self.scrollView.centerX=screenW * 0.5;
    }
    
    //获取图片
    
    [self.progsView setProgress:self.model.pictureProgress animated:YES];

    [imageView sd_setImageWithURL:[NSURL URLWithString:self.model.image1] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progsView.hidden=NO;
        
        [self.progsView setProgress:self.model.pictureProgress animated:NO];
        self.progsView.progressLabel.text=[NSString stringWithFormat:@"%f%%",(self.model.pictureProgress *100)];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progsView.hidden=YES;
    }];
    
    //设置转发评论数量
    [self.commentButton setTitle:[NSString stringWithFormat:@"%ld",self.model.comment] forState:UIControlStateNormal];
    [self.transpondButton setTitle:[NSString stringWithFormat:@"%ld",self.model.repost] forState:UIControlStateNormal];
    
}
//-(void)awakeFromNib{
//    self.progressView.roundedCorners=2;
//    self.progressView.progressLabel.textColor=[UIColor whiteColor];
//
//}

//点击退出
-(void)exit{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//后退
- (IBAction)exitAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//保存
- (IBAction)saveButtonAction:(id)sender {
    if(self.imageView.image==nil)return;
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (!error) {
        [SVProgressHUD showSuccessWithStatus:@"保存图片成功"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }
    
}
//评论
- (IBAction)commentAction:(id)sender {
}
//转发
- (IBAction)transpondAction:(id)sender {
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
