//
//  UITextField+Placeholder.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/9.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "UITextField+Placeholder.h"
#import <objc/runtime.h>
@implementation UITextField (Placeholder)

- (void)setPlaceLableColor:(UIColor *)placeLableColor {
    objc_setAssociatedObject(self, @"color", placeLableColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //使用KVC来修改系统内部的成员变量的字体颜色，前提是先用runtime来获取这个成员变量的名字
    [self setValue:placeLableColor forKeyPath:@"placeholderLabel.textColor"];
    
}
- (UIColor *)placeLableColor {
    return objc_getAssociatedObject(self, @"color");
}

@end
