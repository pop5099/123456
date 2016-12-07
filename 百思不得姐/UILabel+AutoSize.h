//
//  UILabel+AutoSize.h
//  Pop
//
//  Created by mac on 16/9/5.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoSize)
//单行自适应最终的长度
@property(nonatomic ,assign,readonly)CGFloat finalWidth;
//多行
@property(nonatomic ,assign,readonly)CGFloat finalHeight;
@end
