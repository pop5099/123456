//
//  MytextFile.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/9.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "MytextFile.h"

@implementation MytextFile

//- (void)setPlaceholdLabelTextColor:(UIColor *)placeholdLabelTextColor {
//    [self setValue:placeholdLabelTextColor forKeyPath:@"placeholderLabel.textColor"];
//}
//- (UIColor *)placeholdLabelTextColor {
//    return [self valueForKeyPath:@"placeholderLabel.textColor"];
//}
-(void)awakeFromNib{
//    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    self.tintColor=self.textColor;
    //不成为第一相应
    [self resignFirstResponder];
}
//当文本框聚焦
-(BOOL)becomeFirstResponder{
    [self setValue:self.textColor forKeyPath:@"placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}
//失去聚焦
-(BOOL)resignFirstResponder{
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super resignFirstResponder];
}
//-(void)setHighlighted:(BOOL)highlighted{
//    [self setValue:self.textColor forKeyPath:@"placeholderLabel.textColor"];
//}
@end
