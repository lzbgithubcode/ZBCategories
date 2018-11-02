//
//  UIImage+ZBCapture.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
// 捕获类

#import <UIKit/UIKit.h>

@interface UIImage (ZBCapture)

/**
截取指定View生成图片

@param view 捕获View
@return 图片
*/
+ (UIImage *)zb_captureWithView:(UIView *)view;


/**
 从一个大图中截取某个区域生成图片

 @param captureImageRect 捕获区域
 @param bigImage 大图
 @return 图片
 */
+ (UIImage *)zb_captureImageWithSize:(CGRect)captureImageRect FromImage:(UIImage *)bigImage;

@end
