//
//  CrossPicView.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/11.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "CrossPicView.h"
#import "CrossModel.h"
#import "ShowPicViewController.h"
@implementation CrossPicView

+(instancetype)pictureView{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}
-(void)setModel:(CrossModel *)model{
    
    //显示最新的进度值 （防止网速慢，显示其他图片的下载进度）
    [self.progressView setProgress:model.pictureProgress animated:YES];
    
    _model=model;
    //设置图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image0] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden=NO;
        model.pictureProgress =1.0 * receivedSize / expectedSize ;
        [self.progressView setProgress:model.pictureProgress animated:YES];
         self.progressView.progressLabel.text=[NSString stringWithFormat:@"%f%%",(model.pictureProgress *100)];
       
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden=YES;
       
        if (model.isBigPicture==NO) {
            //小图不做处理
        }else{
            //开启图形上下文
            UIGraphicsBeginImageContextWithOptions(model.pictureFrame.size, YES, 0.0);
            //将下载完的image绘制到图形上下文
            CGFloat width=model.pictureFrame.size.width;
            CGFloat height= width * image.size.height / image.size.width;
            [image drawInRect:CGRectMake(0, 0, width, height)];
            //获得图片
            self.imageView.image=UIGraphicsGetImageFromCurrentImageContext();
            //关闭上下文
            UIGraphicsEndImageContext();
        }
    }];
    //判断是否为gif图片
    //不知道图片扩展名。可以取出图片的第一个字节，就可以判断出图片的具体类型
    NSString *extension=model.image1.pathExtension;
    self.gifImage.hidden=![extension.lowercaseString isEqualToString:@"gif"];
    //判断是否显示大图标志
//    if (model.pictureFrame.size.height==250) {
//        self.seeBigButto.hidden=NO;
//    }else{
//        self.seeBigButto.hidden=YES;
//        
//    }
    if (model.isBigPicture) {
        //大图
        self.seeBigButto.hidden=NO;
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
        self.imageView.layer.masksToBounds=YES;
    }else{
        self.seeBigButto.hidden=YES;
        self.imageView.contentMode=UIViewContentModeScaleToFill;
    }
    
        
}
-(void)awakeFromNib{
    self.progressView.roundedCorners=2;
    self.progressView.progressLabel.textColor=[UIColor whiteColor];
    //给图片设置监听
    self.imageView.userInteractionEnabled=YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPicture)]];
}
-(void)showPicture{
    ShowPicViewController * picVC=[[ShowPicViewController alloc]init];
    picVC.model=self.model;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picVC animated:YES completion:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
