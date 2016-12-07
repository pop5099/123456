//
//  EssenceTableViewCell.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/10.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "EssenceTableViewCell.h"
#import "CrossModel.h"
#import "CrossPicView.h"

@interface EssenceTableViewCell ()
//图片内容
@property (nonatomic,strong)CrossPicView *pictureView;

@end

@implementation EssenceTableViewCell
-(CrossPicView *)pictureView{
    if (!_pictureView) {
        CrossPicView * pictureView=[CrossPicView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView=pictureView;
    }
    return _pictureView;
}

-(void)setModel:(CrossModel *)model{
    
    
    _model=model;
    
    // 新浪加V
    self.sinaV.hidden = !model.isSina_v;
    
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:model.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.name.text=model.name;
    
    //设置帖子创建时间
    self.data.text=model.create_time;
    self.titleImage.layer.cornerRadius=17.5;
    self.titleImage.layer.masksToBounds=YES;
    
    [self setUpButtonTitel:self.zanButton count:model.ding placeholder:@"顶"];
    [self setUpButtonTitel:self.caiButton count:model.cai placeholder:@"踩"];
    [self setUpButtonTitel:self.shareButton count:model.repost placeholder:@"转发"];
    [self setUpButtonTitel:self.commentButton count:model.comment placeholder:@"评论"];
//    [self.caiButton setTitle:[NSString stringWithFormat:@"%ld",model.cai] forState:UIControlStateNormal];
    
//    [self textDate:model.create_time];
    
    //内容
    self.myTextLabel.text=model.text;
    
    //根据帖子内容添加对应的东西
    if (model.type==SameTypePicture) {
        self.pictureView.frame=model.pictureFrame;
        self.pictureView.model=model;
        
    }
   
}
-(void)setUpButtonTitel:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder{
    NSString * title=nil;
    if (count==0) {
        title=placeholder;
    }else if (count>10000) {
        title=[NSString stringWithFormat:@"%.1f万",count/10000.0];
    }else{
        title=[NSString stringWithFormat:@"%ld",count];
    }
    [button setTitle:title forState:UIControlStateNormal];

}


-(void)setFrame:(CGRect)frame{
//    frame.origin.x=10;
//    frame.size.width -=2 * frame.origin.x;
    frame.size.height-=10;
    frame.origin.y +=10;
    [super setFrame:frame];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
