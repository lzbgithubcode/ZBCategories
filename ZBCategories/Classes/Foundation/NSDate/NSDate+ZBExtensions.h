//
//  NSDate+ZBExtensions.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZBExtensions)
/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)zb_day;
- (NSUInteger)zb_month;
- (NSUInteger)zb_year;
- (NSUInteger)zb_hour;
- (NSUInteger)zb_minute;
- (NSUInteger)zb_second;
+ (NSUInteger)zb_day:(NSDate *)date;
+ (NSUInteger)zb_month:(NSDate *)date;
+ (NSUInteger)zb_year:(NSDate *)date;
+ (NSUInteger)zb_hour:(NSDate *)date;
+ (NSUInteger)zb_minute:(NSDate *)date;
+ (NSUInteger)zb_second:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)zb_isLeapYear;
+ (BOOL)zb_isLeapYear:(NSDate *)date;



/**
 日期是否相等

 @param anotherDate 另一个日期
 @return 是否
 */
- (BOOL)zb_isSameDay:(NSDate*)anotherDate;

/**
 是否是同一年

 @param anotherDate  另一个日期
 @return 是否
 */
- (BOOL)zb_isSameYear:(NSDate*)anotherDate;

/**
 多少秒之前
 */
- (NSInteger)zb_secondsAgo;
/**
 多少分钟之前
 */
- (NSInteger)zb_minutesAgo;
/**
 多少小时之前
 */
- (NSInteger)zb_hoursAgo;
/**
 多少月之前
 */
- (NSInteger)zb_monthsAgo;
/**
 多少年之前
 */
- (NSInteger)zb_yearsAgo;
@end

