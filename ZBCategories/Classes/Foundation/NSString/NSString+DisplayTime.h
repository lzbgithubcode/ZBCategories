//
//  NSString+DisplayTime.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DisplayTime)
/**
 通过时间戳计算时间差（几小时前、几天前
 
 @param compareDate compareDate
 @return 时间
 */
+ (NSString *)compareCurrentTime:(NSTimeInterval) compareDate;

/**
 通过时间戳得出对应的时间
 
 @param timestamp 时间戳
 @return 时间
 */
+ (NSString *)getDateStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 //通过时间戳和显示时间
 @param timestamp 时间戳
 @param formatter 格式
 @return 时间
 */
+ (NSString *)getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;
@end
