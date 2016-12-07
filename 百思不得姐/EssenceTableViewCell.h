//
//  EssenceTableViewCell.h
//  百思不得姐
//
//  Created by pop5099 on 16/10/10.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrossModel;
@interface EssenceTableViewCell : UITableViewCell

// 是否为新浪加V用户
@property (nonatomic, assign, getter=isSina_v) BOOL sina_v;

@property (nonatomic,strong)CrossModel * model;
//段子数据
@property (weak, nonatomic) IBOutlet UIImageView *sinaV;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
//帖子的文字内容
@property (weak, nonatomic) IBOutlet UILabel *myTextLabel;

@end
