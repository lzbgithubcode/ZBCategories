//
//  NSTimer+ZBAdd.h
//  ZBCategories
//
//  Created by lzb on 2018/10/22.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (ZBAdd)

/**
 创建并返回一个新的NSTimer对象, 默认加入默认模式，自动启动
 

 @param seconds 计时时间
 @param block 调用block
 @param repeats 是否重复
 @return timer
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;


/**
 创建并返回一个新的NSTimer对象
 你必须addTimer:forMode:才能启动

 @param seconds 计时时间
 @param block 调用block
 @param repeats 是否重复
 @return timer
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
