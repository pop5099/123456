//
//  FirstView.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/9.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView
+(void)show{
    //获取系统版本号
    //    NSLog(@"%@", [[NSBundle mainBundle]infoDictionary]);
    NSString * key=@"CFBundleShortVersionString";
    NSString * currentVersion =[NSBundle mainBundle].infoDictionary[key];
    NSString * sanboxVersion =[[NSUserDefaults standardUserDefaults]stringForKey:key];
    if (![currentVersion isEqualToString:sanboxVersion]) {
        FirstView * vc=[FirstView firstView];
        UIWindow * window=[[UIApplication sharedApplication]keyWindow];
        vc.frame=window.bounds;
        [window addSubview:vc];
        
        //存储版本号
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:key];
        //马上存入
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

+(instancetype)firstView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
- (IBAction)enterAction:(id)sender {
    [self removeFromSuperview];
}
@end
