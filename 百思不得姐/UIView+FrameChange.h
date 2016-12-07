//
//  UIView+FrameChange.h
//  SinaClassTest
//
//  Created by pop on 16/8/31.
//  Copyright © 2016年 Pop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameChange)
//类目不可以扩展实例变量，所以声明的属性，只有set/get方法的声明,所以类目中写的属性，不可以直接去使用，需要自己去实现
@property (nonatomic, assign)CGFloat X;
//- (void)setX:(CGFloat)X;
//- (CGFloat)X;
@property (nonatomic, assign)CGFloat Y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGPoint origin;
@property (nonatomic, assign)CGSize size;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;
@end
