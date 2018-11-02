//
//  UIImage+Operation.h
//  CategoryTest
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//  图片基本操作

#import <UIKit/UIKit.h>

@interface UIImage (Operation)
/**
 把颜色转变为纯色图片
 
 @param aColor 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor;

/**
 把颜色转变为纯色图片
 
 @param aColor 颜色
 @param aFrame 颜色参考点的frame
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;

/**
 转换为原始图片
 @param imageName 图片名
 @return 原始图片
 */
+ (UIImage *)originImageWithName:(NSString *)imageName;


/**
 把图片裁剪成圆形
 
 @return 圆形图片
 */
- (UIImage *)circleImage;



/**
 通过Rect剪裁图片

 @param rect rect
 @return UIImage
 */
- (UIImage *)imageByCropToRect:(CGRect)rect;


/**
 图片增加圆角

 @param radius 圆角
 @return UIImage
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;


/**
 图片增加圆角及边框

 @param radius 圆角
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @return UIImage
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor;


/**
 图片向左90度

 @return UIImage
 */
- (UIImage *)imageByRotateLeft90;


/**
 图片向右90度

 @return UIImage
 */
- (UIImage *)imageByRotateRight90;


/**
 图片转180度

 @return UIImage
 */
- (UIImage *)imageByRotate180;


@end
