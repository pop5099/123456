//
//  TitleTableViewCell.m
//  百思不得姐
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "TitleTableViewCell.h"
#import "TitleModel.h"
#import "ContentModel.h"

@interface TitleTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *selectView;
@property (strong, nonatomic) IBOutlet UIView *bgView;

@end


@implementation TitleTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor=BACCOLOR;
    self.selectView.backgroundColor=[UIColor redColor];
    UIView * bg=[[UIView alloc]init];
    bg.backgroundColor=[UIColor whiteColor];
    self.selectedBackgroundView = bg;
    
    
}
- (void)setTitleModel:(TitleModel *)titleModel
{
    _titleModel = titleModel;
    NSLog(@"%@",titleModel);
    self.textLabel.text = titleModel.name;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    //重新调整frame
    self.textLabel.Y=2;
    self.textLabel.height=self.contentView.height-2 * self.textLabel.Y;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
   
    self.selectView.backgroundColor = (selected == YES) ? [UIColor redColor] : BACCOLOR;
    self.textLabel.textColor = selected ? self.selectView.backgroundColor : [UIColor grayColor];
    self.bgView.backgroundColor = selected ? [UIColor clearColor] : [UIColor clearColor];



}

@end
