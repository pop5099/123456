//
//  TitleModel.h
//  百思不得姐
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TitleModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong)NSMutableArray * userArray;
// 总页数
//@property (nonatomic,assign)NSInteger total_page;
//总数
@property (nonatomic,assign)NSInteger total;
//当前页
@property (nonatomic,assign)NSInteger currentPage;
@end
