//
//  RecomModel.h
//  百思不得姐
//
//  Created by pop5099 on 16/10/6.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecomModel : NSObject
//推荐标签的图片url地址
@property (nonatomic,strong)NSString *image_list;
//标签名称
@property (nonatomic,strong)NSString *theme_name;
//此标签的订阅量
@property (nonatomic,assign)NSInteger sub_number;

@end
