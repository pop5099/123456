//
//  ContentTableViewCell.m
//  百思不得姐
//
//  Created by mac on 16/9/28.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "ContentTableViewCell.h"
#import "ContentModel.h"

@interface ContentTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;

@end

@implementation ContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
-(void)setContenModel:(ContentModel *)contenModel{
    _contenModel=contenModel;
    self.nameLabel.text=contenModel.screen_name;
    self.fansLabel.text=[NSString stringWithFormat:@"%ld人关注",contenModel.fans_count];
    self.headerImage.layer.cornerRadius=25;
    self.headerImage.layer.masksToBounds=YES;
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:contenModel.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
@end
