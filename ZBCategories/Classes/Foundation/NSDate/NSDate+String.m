//
//  NSDate+String.m
//  ATBSecurity
//
//  Created by lzb on 2018/6/19.
//  Copyright © 2018年 ATBSecurity. All rights reserved.
//

#import "NSDate+String.h"
#import "NSDate+ZBExtensions.h"

static NSString *kNSDateHelperFormatDate             = @"yyyy-MM-dd";
static NSString *kNSDateHelperFormatTime             = @"HH:mm:ss";
static NSString *kNSDateHelperFormatDateWithTime     = @"yyyy-MM-dd HH:mm:ss";

@implementation NSDate (String)

+ (NSString*)datetimeForNow
{
    NSDate* now = [NSDate date];
    NSDate* localNow = [self getNowDateFromatAnDate:now];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:ss:mm.SSS"];
    
    return [formatter stringFromDate:localNow];
}

+ (NSInteger)minutesOffsetBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSTimeInterval timeInterval=[startDate timeIntervalSinceDate:endDate];
    return timeInterval/60;
}
+ (NSString *)weekdayFrom:(NSDate *)inputDate{
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;
    comps =[calendar components:(NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday |NSCalendarUnitWeekdayOrdinal)
                       fromDate:inputDate];
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    NSString *week = @"";
    switch (weekday) {
        case 1:
            week = @"周日";
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
            week = @"周六";
            break;
            
        default:
            break;
    }
    
    return week;
    
}


+ (NSString *)weekdayFromDateStr:(NSString *)dateStr{
    NSDate *date=[NSDate dateFromString:dateStr withFormat:[NSDate dateFormatString]];
    return [NSDate weekdayFrom:date];
}
+ (NSString *)weektodayFromDateStr:(NSString *)dateStr{
    NSDate *date=[NSDate dateFromString:dateStr withFormat:[NSDate dateFormatString]];
    
    NSDate *dateSelf = [NSDate dateStandardFormatTimeZeroWithDate:date];
    NSTimeInterval timeInterval = [dateSelf timeIntervalSince1970];
    NSDate *dateNow = [NSDate dateStandardFormatTimeZeroWithDate:nil];
    NSTimeInterval timeIntervalNow = [dateNow timeIntervalSince1970];
    
    NSTimeInterval cha = timeInterval - timeIntervalNow;
    double chaDay = cha / 86400.0;
    NSInteger day = chaDay * 1;
    switch (day) {
        case 0:
            return @"今天";
            break;
        case 1:
            return @"明天";
            break;
        default:
            [NSDate weekdayFrom:date];
            break;
    }
    return [NSDate weekdayFrom:date];
}
+ (NSString *)stringYearMonthDayWithDate:(NSDate *)date
{
    if (date == nil) {
        date = [NSDate date];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

- (NSString *)timeHourMinuteWithPrefix:(BOOL)enablePrefix suffix:(BOOL)enableSuffix
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *timeStr = [formatter stringFromDate:self];
    if (enablePrefix) {
        timeStr = [NSString stringWithFormat:@"%@%@",([self hour] > 12 ? @"下午" : @"上午"),timeStr];
    }
    if (enableSuffix) {
        timeStr = [NSString stringWithFormat:@"%@%@",([self hour] > 12 ? @"pm" : @"am"),timeStr];
    }
    return timeStr;
}

+ (NSString *)stringLoacalDate
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [format  setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSString *dateStr = [format stringFromDate:localeDate];
    
    return dateStr;
}
+ (NSString *)timeStringFromSecondsValue:(int)seconds{
    NSString *retVal;
    int hours = seconds / 3600;
    int minutes = (seconds / 60) % 60;
    int secs = seconds % 60;
    if (hours > 0) {
        retVal = [NSString stringWithFormat:@"%01d:%02d:%02d", hours, minutes, secs];
    } else {
        retVal = [NSString stringWithFormat:@"00:%02d:%02d", minutes, secs];
    }
    return retVal;
}


#pragma mark -  private

- (NSString *)weekday
{
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;
    
    NSDate *date = [NSDate date];
    comps =[calendar components:(kCFCalendarUnitWeek | NSCalendarUnitWeekday |NSCalendarUnitWeekdayOrdinal)
                       fromDate:date];
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    NSString *week = @"";
    switch (weekday) {
        case 1:
            week = @"星期日";
            break;
        case 2:
            week = @"星期一";
            break;
        case 3:
            week = @"星期二";
            break;
        case 4:
            week = @"星期三";
            break;
        case 5:
            week = @"星期四";
            break;
        case 6:
            week = @"星期五";
            break;
        case 7:
            week = @"星期六";
            break;
            
        default:
            break;
    }
    
    return week;
}
+ (NSString *)dateFormatString {
    return @"yyyy-MM-dd";
}
+ (NSString *)timeFormatString {
    return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString {
    return @"yyyy-MM-dd HH:mm:ss";
}

+ (NSString *)timestampFormatStringSubSeconds
{
    return @"yyyy-MM-dd HH:mm";
}
+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}
+ (NSString *)dbFormatString {
    return [NSDate timestampFormatString];
}
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

- (NSInteger)hour
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit  fromDate:self];
    return [dateComponents hour];
}
+(NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
        //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
                                                                              //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
        //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
        //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
        //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
        //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}
+ (NSDate *) dateStandardFormatTimeZeroWithDate: (NSDate *) aDate{
    NSString *str = [[NSDate stringYearMonthDayWithDate:aDate]stringByAppendingString:@" 00:00:00"];
    NSDate *date = [NSDate dateFromString:str];
    return date;
}

/**
 标准格式的时间格式
 
 @param format  e.g. @"yyyy-MM-dd HH:mm:ss"
 @return 时间
 */
- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

#pragma mark - 时间格式转化
- (NSString *)string_MM_dd
{
  return [self stringWithFormat:@"MM月dd日"];
}
- (NSString *)string_yyyy_MM_dd
{
   return  [self stringWithFormat:@"yyyy-MM-dd"];
}
- (NSString *)string_yyyy_MM
{
   return [self stringWithFormat:@"yyyy年MM月"];
}
- (NSString *)string_HH_mm
{
    return [self stringWithFormat:@"HH:mm"];
}
- (NSString *)string_a_HH_mm
{
    NSString *text = nil;
    NSString *aStr, *timeStr;
    timeStr = [self stringWithFormat:@"hh:mm"];
    NSUInteger hour = [self hour];
    if (hour < 3) {
        aStr = @"凌晨";
    }else if (hour >= 3 && hour < 12){
        aStr = @"上午";
    }else if (hour >= 12 && hour < 13){
        aStr = @"中午";
    }else if (hour >= 13 && hour < 18){
        aStr = @"下午";
    }else{
        aStr = @"晚上";
    }
    text = [NSString stringWithFormat:@"%@ %@", aStr, timeStr];
    return text;
}
- (NSString *)string_yyyy_MM_dd_hh_mm_ss
{
    return [self stringWithFormat:@"yyyy-MM-dd HH:mm"];
}
- (NSString *)stringStandard
{
    NSDate *today = [NSDate date];
    NSString *text = nil;
    NSInteger agoCount = [self zb_yearsAgo];
    if (agoCount > 0) {
        text = [self string_yyyy_MM];
    }else{ //今天以前

        if ([self zb_isSameYear:today] == NO) {
            text = [self string_yyyy_MM];
        }

        if ([self zb_isSameDay:today] == NO) {
            text = [self string_MM_dd];
        }else {
            agoCount = [self zb_hoursAgo];
            if (agoCount >= 1) {
                text = [self string_HH_mm];
            }else {
                agoCount = [self zb_minutesAgo];
                if (agoCount > 1) {
                    text = [NSString stringWithFormat:@"%ld分钟前", (long)agoCount];
                }else{
                    text = @"刚刚";
                }
            }
        }
    }
    return text;

}

@end
