//
//  NSDate+Date.h
//  ATBSecurity
//
//  Created by lzb on 2018/6/19.
//  Copyright © 2018年 ATBSecurity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Date)

#pragma mark - date 处理

/**
 明天的日期

 @return date
 */
+ (NSDate *)dateTomorrow;

/**
 昨天的日期

 @return date
 */
+ (NSDate *)dateYesterday;

/**
 距离days天之后的日期

 @param days 几天
 @return date
 */
+ (NSDate *)dateWithDaysFromNow: (NSInteger) days;

/**
 days天之前的日期

 @param days  几天
 @return date
 */
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;

#pragma mark -Date week--day
/**
 返回未来一周日期（格式：明天 08-09...）
 */
+(NSArray *)dateWeekAndDayFromdate:(NSDate *)date;
/**
 返回未来count天日期 （格式：周几 08-09...）
 */
+(NSArray *)dateWeekAndDayFromCount:(NSInteger)count;
/**
 返回未来count天日期 （格式：明天 08-09，周几 08-10...）
 */
+(NSArray *)dateWeekNowdayAndDayFromCount:(NSInteger)count;
/**
 返回未来count天日期 （2018-08-09...）
 */
+(NSArray *)dateAndDayYearFromCount:(NSInteger)count;
/**
  返回未来count天日期 + date 当前日期 （2018-08-09...）
 */
+(NSArray *)dateAndDayYearFromdate:(NSDate *)date Count:(NSInteger)count;

#pragma mark - 日期保存、比较
/**
 比较两个日期的先后
 */
+(BOOL)compareDateisOverWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

@end
