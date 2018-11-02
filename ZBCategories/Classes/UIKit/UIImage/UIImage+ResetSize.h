//
//  UIImage+ResetSize.h
//  CategoryTest
//
//  Created by lzb on 2018/8/10.
//  Copyright © 2018年 lzb. All rights reserved.
//// 图片大小修改

#import <UIKit/UIKit.h>

@interface UIImage (ResetSize)
/**
 修改图片的大小

 @param targetSize 大小
 @return 图片
 */
-(UIImage*)imageByScaleToSize:(CGSize)targetSize;

-(UIImage *)imageByScaledToSize:(CGSize)targetSize highQuality:(BOOL)highQuality;



/**
 将图片剪裁至目标尺寸

 @param sourceImage 图片
 @param targetSize 目标尺寸
 @return UIImage
 */
+ (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;

/**
 放大图片CGSize

 @param size CGSize
 @return UIImage
 */
- (UIImage *) imageByResizeWithMaxSize:(CGSize)size;


/**
 缩小图片CGSize

 @param size CGSize
 @return UIImage
 */
- (UIImage *) imageWithThumbnailForSize:(CGSize)size;

/**
 图片旋转角度

 @param degrees 角度
 @return UIImage
 */
- (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;


/**
 拉伸图片UIEdgeInsets

 @param insets insets
 @return UIImage
 */
- (UIImage *) resizableImage:(UIEdgeInsets)insets;


/**
 拉伸图片CGFloat

 @param scale 比例
 @return UIImage
 */
- (UIImage *) imageByResizeToScale:(CGFloat)scale;


@end

