//
//  NSDate+String.h
//  ATBSecurity
//
//  Created by lzb on 2018/6/19.
//  Copyright © 2018年 ATBSecurity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (String)
/**
 获取当前时间
 
 @return 返回当前时间
 */
+ (NSString*)datetimeForNow;

/**
 获取时间间隔的分钟数
 
 @param startDate 开始时间
 @param endDate 结束世界
 @return 返回分钟数
 */
+ (NSInteger)minutesOffsetBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

/**
 date 转星期

 @param inputDate date
 @return string
 */
+ (NSString *)weekdayFrom:(NSDate *)inputDate;

/**
 string（格式： 2018.08.12 2018-08-12） 转 星期

 @param dateStr date
 @return string
 */
+ (NSString *)weekdayFromDateStr:(NSString *)dateStr;


/**
 日期转文字 （eg：2018.08.10 - > 明天）

 @param dateStr 日期字符串
 @return string
 */
+ (NSString *)weektodayFromDateStr:(NSString *)dateStr;

/**
 返回传入的时间

 @param date date
 @return 日期 （eg：2018-08-09）
 */
+ (NSString *)stringYearMonthDayWithDate:(NSDate *)date;
/**
 返回当前的时间
 
 @param enablePrefix 时间中文（eg：上午）
 @param enableSuffix 时间简写（eg：am）
 @return 时间（eg：am上午10:12）
 */
- (NSString *)timeHourMinuteWithPrefix:(BOOL)enablePrefix suffix:(BOOL)enableSuffix;

/**
 返回当前年月日时分秒

 @return 时间
 */
+ (NSString *)stringLoacalDate;


/**
 秒转分 （eg:00:06:01）

 @param seconds 秒
 @return string 分
 */
+ (NSString *)timeStringFromSecondsValue:(int)seconds;



/**
 标准格式的时间格式

 @param format  e.g. @"yyyy-MM-dd HH:mm:ss"
 @return 时间
 */
- (NSString *)stringWithFormat:(NSString *)format;



#pragma mark - 时间格式转化

/**
 时间格式 ：e.g 10月23日

 @return str
 */
- (NSString *)string_MM_dd;
/**
 时间格式 ：e.g 1991-10-23
 
 @return str
 */
- (NSString *)string_yyyy_MM_dd;
/**
 时间格式 ：e.g 1991年-12月
 
 @return str
 */
- (NSString *)string_yyyy_MM;
/**
 时间格式 ：e.g 上午 23：34
 
 @return str
 */
- (NSString *)string_a_HH_mm;

/**
 时间格式 ：e.g  23：34
 
 @return str
 */
- (NSString *)string_HH_mm;
/**
 时间格式 ：e.g 1991-10-21 23：45：12
 
 @return str
 */
- (NSString *)string_yyyy_MM_dd_hh_mm_ss;
/**
 时间格式 ：e.g 1991-10月-日
 
 @return str
 */
- (NSString *)stringStandard;

@end
