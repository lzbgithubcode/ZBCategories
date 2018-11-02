//
//  NSTimer+ZBExtension.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ZBExtension)
/**
 *  暂停NSTimer
 */
- (void)zb_pauseTimer;
/**
 *  开始NSTimer
 */
- (void)zb_resumeTimer;

/**
 *  延迟开始NSTimer
 */
- (void)zb_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
