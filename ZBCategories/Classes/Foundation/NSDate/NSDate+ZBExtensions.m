//
//  NSDate+ZBExtensions.m
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSDate+ZBExtensions.h"

@implementation NSDate (ZBExtensions)
/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)zb_day
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}
- (NSUInteger)zb_month{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}
- (NSUInteger)zb_year{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}
- (NSUInteger)zb_hour{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}
- (NSUInteger)zb_minute{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}
- (NSUInteger)zb_second{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}
+ (NSUInteger)zb_day:(NSDate *)date{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:date] day];
}
+ (NSUInteger)zb_month:(NSDate *)date{
   return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:date] month];
}
+ (NSUInteger)zb_year:(NSDate *)date{
   return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:date] year];
}
+ (NSUInteger)zb_hour:(NSDate *)date{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:date] hour];
}
+ (NSUInteger)zb_minute:(NSDate *)date{
   return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:date] minute];
}
+ (NSUInteger)zb_second:(NSDate *)date{
   return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:date] second];
}

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)zb_isLeapYear{
    NSUInteger year = self.zb_year;
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}
+ (BOOL)zb_isLeapYear:(NSDate *)date
{
    NSUInteger year = [self zb_year:date];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

/**
 日期是否相等
 
 @param anotherDate 另一个日期
 @return 是否
 */
- (BOOL)zb_isSameDay:(NSDate*)anotherDate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    NSDateComponents* components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:anotherDate];
    return ([components1 year] == [components2 year] && [components1 month] == [components2 month] && [components1 day] == [components2 day]);
}
- (BOOL)zb_isSameYear:(NSDate*)anotherDate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    NSDateComponents* components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:anotherDate];
    return ([components1 year] == [components2 year]);
}

/**
 多少秒之前
 */
- (NSInteger)zb_secondsAgo{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components second];
}
/**
 多少分钟之前
 */
- (NSInteger)zb_minutesAgo
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMinute
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components minute];
}
/**
 多少小时之前
 */
- (NSInteger)zb_hoursAgo
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components hour];
}
/**
 多少月之前
 */
- (NSInteger)zb_monthsAgo
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components month];
}
/**
 多少年之前
 */
- (NSInteger)zb_yearsAgo
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components year];
}

@end
