//
//  CATransaction+ZBAnimateWithDuration.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATransaction (ZBAnimateWithDuration)
/**
 *  @brief  CATransaction 动画执 block回调
 *
 *  @param duration   动画时间
 *  @param animations 动画块
 *  @param completion 动画结束回调
 */
+(void)animateWithDuration:(NSTimeInterval)duration
                   animations:(nullable void (^)(void))animations
                   completion:(nullable void (^)(void))completion;
@end
