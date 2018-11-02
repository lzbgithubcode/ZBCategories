//
//  NSDate+Date.m
//  ATBSecurity
//
//  Created by lzb on 2018/6/19.
//  Copyright © 2018年 ATBSecurity. All rights reserved.
//

#import "NSDate+Date.h"

#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

#define D_MINUTE 60
#define D_HOUR   3600
#define D_DAY    86400
#define D_WEEK   604800
#define D_YEAR   31556926

@implementation NSDate (Date)

#pragma mark - date 处理

+ (NSDate *) dateTomorrow
{
    return [NSDate dateWithDaysFromNow:1];
}

+ (NSDate *) dateYesterday
{
    return [NSDate dateWithDaysBeforeNow:1];
}

+ (NSDate *) dateWithDaysFromNow: (NSInteger) days
{
    return [[NSDate date] dateByAddingDays:days];
}

+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days
{
    return [[NSDate date] dateBySubtractingDays:days];
}

#pragma mark -Date week--day
//返回今天明天星期几 01-04
+(NSArray *)dateWeekAndDayFromdate:(NSDate *)date{
    NSDate *currentDate = date;//获取当前时间，日期
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSMutableArray *_mutArr=[[NSMutableArray alloc]init];
    for (int x=0; x<7; x++) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSString *week;
        if (x==0) {
            week=@"今天";
        }else if(x==1){
            week=@"明天";
        }else{
            week=[NSDate weekdayNoWeeksFrom:currentDate];
        }
        if (week) {
            [_mutArr addObject:[NSString stringWithFormat:@"%@ %@",week,dateString]];
        }
        
        currentDate= [currentDate initWithTimeIntervalSinceNow: +oneDay*(x+1)];
        
    }
    return [NSArray arrayWithArray:_mutArr];
    
}
    //返回星期－ 01-04 除去周末
+(NSArray *)dateWeekAndDayFromCount:(NSInteger)count{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSMutableArray *_mutArr=[[NSMutableArray alloc]init];
    for (int x=0; x<count; x++) {
        currentDate= [currentDate initWithTimeIntervalSinceNow: +oneDay*(x+1)];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSString *week=[NSDate weekdayNoWeeksFrom:currentDate];
        if (week) {
            [_mutArr addObject:[NSString stringWithFormat:@"%@ %@",week,dateString]];
        }
    }
    return [NSArray arrayWithArray:_mutArr];
}
    //返回明天 星期－ 01-04
+(NSArray *)dateWeekNowdayAndDayFromCount:(NSInteger)count{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSMutableArray *_mutArr=[[NSMutableArray alloc]init];
    for (int x=0; x<count; x++) {
        currentDate= [currentDate initWithTimeIntervalSinceNow: +oneDay*(x+1)];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSString *week=!x?@"明天":[NSDate weekdayNoWeeksFrom:currentDate];
        if (week) {
            [_mutArr addObject:[NSString stringWithFormat:@"%@ %@",week,dateString]];
        }
    }
    return [NSArray arrayWithArray:_mutArr];
}

    //返回
+(NSArray *)dateAndDayYearFromCount:(NSInteger)count{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSMutableArray *_mutArr=[[NSMutableArray alloc]init];
    for (int x=0; x<count; x++) {
        currentDate= [currentDate initWithTimeIntervalSinceNow: +oneDay*(x+1)];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyy-MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        [_mutArr addObject:dateString];
    }
    return [NSArray arrayWithArray:_mutArr];
}
    //根据时间返回从此时间开始的几天时间数组
+(NSArray *)dateAndDayYearFromdate:(NSDate *)date Count:(NSInteger)count{
    
    NSDate *currentDate = date;//获取当前时间，日期
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSMutableArray *_mutArr=[[NSMutableArray alloc]init];
    for (int x=0; x<count; x++) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyy-MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        [_mutArr addObject:dateString];
        currentDate= [currentDate initWithTimeIntervalSinceNow: +oneDay*(x+1)];
    }
    return [NSArray arrayWithArray:_mutArr];
    
}

#pragma mark - 比较两个日期的先后

+(BOOL)compareDateisOverWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSComparisonResult result =[startDate compare:endDate];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending:  break;
            //date02比date01小
        case NSOrderedDescending: return YES;
            //date02=date01
        case NSOrderedSame:  break;
        
    }
    
    return NO;
}

#pragma mark - private

- (NSDate *) dateBySubtractingDays: (NSInteger) dDays
{
    return [self dateByAddingDays: (dDays * -1)];
}

    //获取当天星期几 除去星期六星期天
+ (NSString *)weekdayNoWeeksFrom:(NSDate *)inputDate{
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;
    comps =[calendar components:(NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear |NSCalendarUnitWeekdayOrdinal)
                       fromDate:inputDate];
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    NSString *week = @"";
    switch (weekday) {
        case 1:
            return @"周日";
            break;
        case 2:
            week = @"周一";
            break;
        case 3:
            week = @"周二";
            break;
        case 4:
            week = @"周三";
            break;
        case 5:
            week = @"周四";
            break;
        case 6:
            week = @"周五";
            break;
        case 7:
            return @"周六";
            break;
            
        default:
            break;
    }
    
    return week;
}
- (NSDate *) dateByAddingDays: (NSInteger) dDays
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_DAY * dDays;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

@end
