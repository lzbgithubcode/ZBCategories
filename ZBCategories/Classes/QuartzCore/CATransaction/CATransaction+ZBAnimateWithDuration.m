//
//  CATransaction+ZBAnimateWithDuration.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CATransaction+ZBAnimateWithDuration.h"

@implementation CATransaction (ZBAnimateWithDuration)
/**
 *  @brief  CATransaction 动画执 block回调
 *
 *  @param duration   动画时间
 *  @param animations 动画块
 *  @param completion 动画结束回调
 */
+(void)animateWithDuration:(NSTimeInterval)duration
                animations:(nullable void (^)(void))animations
                completion:(nullable void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    if(completion){
        [CATransaction setCompletionBlock:completion];
    }
    
    if(animations){
        animations();
    }
    [CATransaction commit];
}
@end
