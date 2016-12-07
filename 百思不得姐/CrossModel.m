//
//  CrossModel.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/10.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "CrossModel.h"
@implementation CrossModel


//替换
//+(NSDictionary *)mj_replacedKeyFromPropertyName{
//    return{@"ID":@"id"};
//}
//+(id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
//    
//}
//-(NSString *)create_time{
//    //日期格式化
//    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
//    formatter.dateFormat=@"yyyy-MM-dd HH:mm:ss";
//    //发帖时间
//    NSDate * create=[formatter dateFromString:_create_time];
//    //当前时间
//    //    NSDate * now =[NSDate date];
//    if (create.isThisYear) {
//        //今年
//        if (create.isToday) {
//            //今天
//            NSDateComponents * components = [[NSDate date]deltaFrom:create ];
//            if (components.hour>=1) {
//                //大于等于1小时
//                return [NSString stringWithFormat:@"%ld小时前",components.hour];
//            }else if(components.minute>=1 ){
//                //小于一小时大于1分钟
//                return [NSString stringWithFormat:@"%ld分钟前",components.minute];
//            }else{
//                //小于1分钟
//                return @"刚刚";
//            }
//        }else if (create.isYesterday){
//            //昨天
//            formatter.dateFormat=@"昨天 HH:mm:ss";
//            return [formatter stringFromDate:create];
//        }else{
//            //其他
//            formatter.dateFormat=@"MM-dd HH:mm:ss";
//            return [formatter stringFromDate:create];
//        }
//    }else{
//        //不是今年
//        return _create_time;
//    }
//
//}
-(CGFloat)cellHeight{
    
    if (!_cellHeight) {
        //计算高度
        CGFloat textY= 55;
        CGFloat buttonH= 44;
        //文字高度
        
        
        CGSize maxSize=CGSizeMake([UIScreen mainScreen].bounds.size.width-20, MAXFLOAT);
        //废弃方法
        //    CGFloat textH=[model.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:maxSize].height;
        CGFloat textH=[self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
         _cellHeight=textY + textH + buttonH ;
        if (self.type==SameTypePicture) {
            //图片显示出的宽度
            CGFloat pictureW=maxSize.width;
            CGFloat pictureH=self.height/ self.width * pictureW;
//            NSLog(@"图片高度%f",self.height);
            if (pictureH>=1000) {
                pictureH=250;
                //大图
                self.bigPicture=YES;
            }
            
            _pictureFrame=CGRectMake(10, textH+textY+10, pictureW, pictureH);
             _cellHeight +=pictureH+10;
        }
       

    }
    return _cellHeight +20;
}
@end
