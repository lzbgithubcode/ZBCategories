//
//  UIView+Animation.m
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

/**
 左右抖动动画
 */
- (void)addShakeAnimation
{
    CALayer* layer = [self layer];
    CGPoint position = [layer position];
    CGPoint y = CGPointMake(position.x - 8.0f, position.y);
    CGPoint x = CGPointMake(position.x + 8.0f, position.y);
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.08f];
    [animation setRepeatCount:3];
    [layer addAnimation:animation forKey:nil];
}


/**
 旋转180度
 */
- (void)addTrans180DegreeAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    }];
}

/**
 增加缩放动画
 */
- (void)addAnimationWithScaleShrink
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.5;
    animation.repeatCount = YES;
    animation.values = @[@0.8,@0.9,@1.0,@1.1,@1.2,@1.1,@1.0,@0.9,@0.8];
    animation.autoreverses = YES;
    // 设置重复次数为无限大
    animation.repeatCount = FLT_MAX;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:animation forKey:nil];
}

@end
