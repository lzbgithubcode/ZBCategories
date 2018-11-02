//
//  UIImage+ZBFileName.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
// 加载图片名称

#import <UIKit/UIKit.h>

@interface UIImage (ZBFileName)
/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)zb_imageWithFileName:(NSString *)name;

/**
 *  根据指定bundle中的文件名读取图片
 *
 *  @param name   图片名
 *  @param bundle bundle
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)zb_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;
@end
