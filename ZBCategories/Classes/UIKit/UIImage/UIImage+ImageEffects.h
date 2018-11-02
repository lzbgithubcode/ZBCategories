//
//  UIImage+ImageEffects.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//// 图片效果

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)

/**
 图片毛玻璃效果

 @return 处理之后的图片
 */
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyBlurEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;
@end

@interface UIImage (Blur)
//毛玻璃效果
- (UIImage *)imageByBlurSoft;

- (UIImage *)imageByBlurLight;

- (UIImage *)imageByBlurExtraLight;

- (UIImage *)imageByBlurDark;

- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;

- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;

@end


