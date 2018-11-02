//
//  NSTimer+ZBExtension.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSTimer+ZBExtension.h"

@implementation NSTimer (ZBExtension)
/**
 *  暂停NSTimer
 */
- (void)zb_pauseTimer
{
    if(![self isValid]){
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}
/**
 *  开始NSTimer
 */
- (void)zb_resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

/**
 *  延迟开始NSTimer
 */
- (void)zb_resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}
@end
