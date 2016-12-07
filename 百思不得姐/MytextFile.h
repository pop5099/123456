//
//  MytextFile.h
//  百思不得姐
//
//  Created by pop5099 on 16/10/9.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MytextFile : UITextField
//继承自UITextField 增加一个属性用于来改变输入框的占位符的颜色
@property (nonatomic, strong)UIColor *placeholdLabelTextColor;
@end
