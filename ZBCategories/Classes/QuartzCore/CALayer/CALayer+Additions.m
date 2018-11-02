//
//  CALayer+Additions.m
//  CategoryTest
//
//  Created by lzb on 2018/8/8.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "CALayer+Additions.h"

@implementation CALayer (Additions)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

/**
 设置layer的阴影
 
 @param color 阴影颜色
 @param offset 阴影偏移
 @param radius 阴影圆角
 */
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius
{
    self.shadowColor = color.CGColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shadowOpacity = 1;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)removeAllSublayers {
    while (self.sublayers.count) {
        [self.sublayers.lastObject removeFromSuperlayer];
    }
}

@end
