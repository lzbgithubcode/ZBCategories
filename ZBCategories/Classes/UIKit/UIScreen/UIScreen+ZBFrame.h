//
//  UIScreen+ZBFrame.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (ZBFrame)

/**
 获取屏幕scale
 */
+  (CGFloat)zb_scale;

/**
  获取屏幕size
 */
+  (CGSize)zb_size;
/**
 获取屏幕宽度
 */
+ (CGFloat)zb_width;
/**
 获取屏幕高度
 */
+ (CGFloat)zb_height;

/**
 获取旋转屏幕size
 */
+ (CGSize)zb_orientationSize;
/**
 获取旋转屏幕宽度
 */
+ (CGFloat)zb_orientationWidth;
/**
 获取旋转屏幕高度
 */
+ (CGFloat)zb_orientationHeight;

/**
 *  检测设备是否是Retina
 */
+ (BOOL)isRetina;

/**
 *  检测设备是否是RetinaHD
 */
+ (BOOL)isRetinaHD;
@end
