//
//  TitleModel.m
//  百思不得姐
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "TitleModel.h"

@implementation TitleModel
-(NSMutableArray *)userArray{
    if (!_userArray) {
        self.userArray=[NSMutableArray array];
    }
    return _userArray;
}

@end
