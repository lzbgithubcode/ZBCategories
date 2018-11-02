//
//  UIView+Animation.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
/**
 左右抖动动画
 */
- (void)addShakeAnimation;


/**
 旋转180度
 */
- (void)addTrans180DegreeAnimation;

/**
 增加缩放动画
 */
- (void)addAnimationWithScaleShrink;
@end
