//
//  UIColor+Category.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)
/**
 *  功能:通过RGB创建颜色
 *
 *  @param red <CGFloat> <范围:0~255.0>
 *  @param green <CGFloat> <范围:0~255.0>
 *  @param blue <CGFloat> <范围:0~255.0>
 *
 *  @return UIColor
 *
 *  example: rgb(173.0,23.0,11.0)
 */
UIColor *rgb(CGFloat red, CGFloat green, CGFloat blue);

/**
 *  功能:通过RGB以及alpha创建颜色
 *
 *  @param red <CGFloat> <范围:0~255.0>
 *  @param green <CGFloat> <范围:0~255.0>
 *  @param blue <CGFloat> <范围:0~255.0>
 *  @param alpha <CGFloat> <范围:0~1.0>
 *
 *  @return UIColor
 *
 *  example: rgbA(173.0,23.0,11.0,0.5)
 */
UIColor *rgbA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);


/**
 功能：获取随机颜色

  @return UIColor
 */
UIColor *randColor(void);

/**
 *  Create a color from a HEX string.
 *  It supports the following type:
 *  - #RGB
 *  - #ARGB
 *  - #RRGGBB
 *  - #AARRGGBB
 *
 *  @param hexString NSString
 *
 *  @return Returns the UIColor instance
 */
+ (UIColor *)hex:(NSString *)hexString;

/**
 *  通过0xffffff的16进制数字创建颜色
 *
 *  @param aRGB 0xffffff
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSUInteger)aRGB;


/**
 调节颜色的明亮度
 
 @param color 颜色
 @param delta 明亮度
 @return UIColor
 */
+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;


/**
 调整颜色的透明度
 
 @param color 颜色
 @param delta 透明度
 @return UIColor
 */
+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;
@end
