//
//  TabBar.m
//  百思不得姐
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "TabBar.h"
#import "UIView+FrameChange.h"
#import "PublishViewController.h"

@interface TabBar ()
//中间的发布按钮
@property (nonatomic ,strong)UIButton * publishButton;

@end

@implementation TabBar
- (UIButton *)publishButton {
    if (!_publishButton) {
        //
        self.publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置背景图片
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [_publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        _publishButton.size = _publishButton.currentBackgroundImage.size;
        
        _publishButton.X = 5;
        
    }
    return _publishButton;
}
-(void)publishClick{
    PublishViewController * publishView=[[PublishViewController alloc]init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:publishView animated:NO completion:nil];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置tabBar的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        [self addSubview:self.publishButton];
    }
    return self;
}

//每次创建完子视图，都会来到这个方法中重新布局子视图，所以我们重写这个方法，等父类执行完，我们就可以来重新修改子视图的位置
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    //设置其他按钮
    for (UIView *button in self.subviews) {
        
        
        //判断不是中间按钮
//        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        // 计算按钮的X值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        // 增加索引
        index++;

    }
    

}



//-(void)layoutSubviews{
//    [super layoutSubviews];
//    
//    // 标记是否已经添加过监听器
//    // 静态变量 后面改了前面也会改，只分配一个内存
//    static BOOL added = NO;
//    
//    CGFloat width=self.width;
//    CGFloat height=self.height;
//    
//    //设置发布button的frame
//    CGFloat buttonY=0;
//    CGFloat buttonW=width/5;
//    CGFloat buttonH=height;
//    NSInteger index =0 ;
//    
//    for (UIControl * button in self.subviews) {
//        if (![button isKindOfClass:[UIColor class]] || button==self.publishButton) continue;
//            //计算按钮的X值
//            CGFloat buttonX=buttonW *((index >1) ? (index+1):index);
//            button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
//            
//            
//            //索引
//            index++;
//            if (added ==0) {
//                //监听按钮点击
//                [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
//            }
//        }
//    
//    added =YES;
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
