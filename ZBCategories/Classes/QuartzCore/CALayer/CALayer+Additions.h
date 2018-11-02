//
//  CALayer+Additions.h
//  CategoryTest
//
//  Created by lzb on 2018/8/8.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Additions)

/**
 设置边框颜色

 @param color 颜色值
 */
- (void)setBorderColorFromUIColor:(UIColor *)color;



/**
 设置layer的阴影

 @param color 阴影颜色
 @param offset 阴影偏移
 @param radius 阴影圆角
 */
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;



/**
 移除所有的layer
 */
- (void)removeAllSublayers;
@end
