//
//  UILabel+AutoSize.m
//  Pop
//
//  Created by mac on 16/9/5.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "UILabel+AutoSize.h"

@implementation UILabel (AutoSize)
//单行自适应的实现
-(CGFloat)finalWidth{
    CGSize size =[self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    return size.width;
}
//多行
-(CGFloat)finalHeight{
    self.numberOfLines=0;
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(kScreenWidth - 20 , 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    return rect.size.height;
}
@end
