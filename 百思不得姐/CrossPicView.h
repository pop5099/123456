//
//  CrossPicView.h
//  百思不得姐
//
//  Created by pop5099 on 16/10/11.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CrossModel;
@interface CrossPicView : UIView
+(instancetype)pictureView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifImage;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButto;
@property (strong, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;


@property (nonatomic,strong)CrossModel * model;
@end
