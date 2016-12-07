//
//  CrossModel.h
//  百思不得姐
//
//  Created by pop5099 on 16/10/10.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SameTableViewController.h"
@interface CrossModel : NSObject
//内容
@property (nonatomic, strong) NSString *text;
//头像
@property (nonatomic, strong) NSString *profile_image;
//名字
@property (nonatomic, strong) NSString *name;
//发帖时间
@property (nonatomic, strong) NSString *create_time;
//赞
@property (nonatomic, assign) NSInteger ding;
//踩
@property (nonatomic, assign) NSInteger cai;
//转发
@property (nonatomic, assign) NSInteger repost;
//评论
@property (nonatomic, assign) NSInteger comment;
// 是否为新浪加V用户
@property (nonatomic, assign, getter=isSina_v) BOOL sina_v;
//图片宽度
@property (nonatomic, assign)CGFloat width;
//图片高度
@property (nonatomic, assign)CGFloat height;
//图片的frame
@property (nonatomic,assign)CGRect pictureFrame;
//图片是否太大
@property (nonatomic,assign,getter=isBigPicture)BOOL bigPicture;
//图片下载进度
@property (nonatomic,assign)CGFloat pictureProgress;
//图片路径
@property (nonatomic, strong)NSString * image0;//小图
@property (nonatomic, strong)NSString * image1;//大图
@property (nonatomic, strong)NSString * image2;//中图

//cell高度
@property (nonatomic, assign) CGFloat cellHeight;
//帖子类型
@property (nonatomic, assign) SameType type;
@end
