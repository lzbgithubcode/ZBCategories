//
//  NSTimer+ZBAdd.m
//  ZBCategories
//
//  Created by lzb on 2018/10/22.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSTimer+ZBAdd.h"

@implementation NSTimer (ZBAdd)
/**
 创建并返回一个新的NSTimer对象，并增加在默认模式
 
 
 @param seconds 计时时间
 @param block 调用block
 @param repeats 是否重复
 @return timer
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats
{
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(execBlock:) userInfo:[block copy] repeats:repeats];
}

/**
 创建并返回一个新的NSTimer对象
 你必须addTimer:forMode:才能启动
 
 @param seconds 计时时间
 @param block 调用block
 @param repeats 是否重复
 @return timer
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats
{
     return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(execBlock:) userInfo:[block copy] repeats:repeats];
}


+ (void)execBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        if(block)
            block(timer);
    }
}
@end
