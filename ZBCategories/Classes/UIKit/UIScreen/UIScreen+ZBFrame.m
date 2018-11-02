//
//  UIScreen+ZBFrame.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIScreen+ZBFrame.h"

@implementation UIScreen (ZBFrame)
/**
 获取屏幕scale
 */
+  (CGFloat)zb_scale
{
    return [UIScreen mainScreen].scale;
}
/**
 获取屏幕size
 */
+  (CGSize)zb_size
{
    return [UIScreen mainScreen].bounds.size;
}
/**
 获取屏幕宽度
 */
+ (CGFloat)zb_width
{
    return [UIScreen mainScreen].bounds.size.width;
}
/**
 获取屏幕高度
 */
+ (CGFloat)zb_height
{
    return [UIScreen mainScreen].bounds.size.height;
}

/**
 获取旋转屏幕size
 */
+ (CGSize)zb_orientationSize
{
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return isLand ? zb_SizeSWAP([self zb_size]) : [self zb_size];
}
/**
 获取旋转屏幕宽度
 */
+ (CGFloat)zb_orientationWidth
{
    return [UIScreen zb_orientationSize].width;
}
/**
 获取旋转屏幕高度
 */
+ (CGFloat)zb_orientationHeight
{
   return [UIScreen zb_orientationSize].height;
}

/**
 *  检测设备是否是Retina
 */
+ (BOOL)isRetina
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  检测设备是否是RetinaHD
 */
+ (BOOL)isRetinaHD
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  交换高度与宽度
 */
static inline CGSize zb_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}
@end
