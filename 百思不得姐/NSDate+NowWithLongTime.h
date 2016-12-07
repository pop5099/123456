//
//  NSDate+NowWithLongTime.h
//  百思不得姐
//
//  Created by pop5099 on 16/10/10.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NowWithLongTime)
-(NSDateComponents *)deltaFrom:(NSDate *)from;
//是否为今年
-(BOOL)isThisYear;
//是否为今天
-(BOOL)isToday;
//是否为昨天
-(BOOL)isYesterday;
@end
