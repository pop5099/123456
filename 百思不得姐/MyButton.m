//
//  MyButton.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/9.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.X = 0;
    self.imageView.Y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    // 调整文字
    self.titleLabel.X = 0;
    self.titleLabel.Y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.Y;
}


@end
