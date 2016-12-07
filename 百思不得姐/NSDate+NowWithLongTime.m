//
//  NSDate+NowWithLongTime.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/10.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "NSDate+NowWithLongTime.h"

@implementation NSDate (NowWithLongTime)
-(NSDateComponents *)deltaFrom:(NSDate *)form{

    //日历
    NSCalendar * calendar =[NSCalendar currentCalendar];
    NSCalendarUnit unit=NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    return [calendar components:unit fromDate:form toDate:self options:0];

}
//是否为今年
-(BOOL)isThisYear{
//    NSDate * now =[NSDate date];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
   NSInteger nowYear= [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
     NSInteger selfYear= [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear==selfYear;
}
//是否为今天
-(BOOL)isToday{
//    NSCalendar * calendar = [NSCalendar currentCalendar];
//    
//    NSCalendarUnit unit= NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
//    NSDateComponents * nowComponents= [calendar components:unit fromDate:[NSDate date]];
//    NSDateComponents * selfComponents=[calendar components:unit fromDate:self];
//    return nowComponents.year==selfComponents.year && nowComponents.month==selfComponents.month && nowComponents.day ==selfComponents.day;
    NSDateFormatter * formatter =[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"yyyy-MM-dd";
    
    NSString* nowStrng =[formatter stringFromDate:[NSDate date]];
    NSString * selfString =[formatter stringFromDate:self];
    return [nowStrng isEqualToString:selfString];
}
//是否为昨天
-(BOOL)isYesterday{
    
    NSDateFormatter * formatter =[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"yyyy-MM-dd";
    
    NSDate * now =[formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
    NSDate * selfDate =[formatter dateFromString:[formatter stringFromDate:self]];
     NSCalendar * calendar =[NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:selfDate toDate:now options:0];
    return components.year==0&& components.month==0 && components.day==1;
}
@end
