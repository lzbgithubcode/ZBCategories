//
//  NSString+ZBSize.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
// 计算文字大小

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ZBSize)

/**
 * 计算文字的高度
 *
 *  @param font  字体
 *  @param maxWidth 约束宽度
 */
- (CGFloat)zb_computeHeigtWithFont:(UIFont *)font constrainedMaxWidth:(CGFloat)maxWidth;

/**
 * 计算文字的宽度
 *
 *  @param font  字体
 *  @param maxHeight 约束宽度
 */
- (CGFloat)zb_computeWidthWithFont:(UIFont *)font constrainedMaxheight:(CGFloat)maxHeight;

/**
 *  计算文字的大小
 *
 *  @param font  字体
 *  @param maxWidth 约束宽度
 */
- (CGSize)zb_computeSizeWithFont:(UIFont *)font constrainedMaxWidth:(CGFloat)maxWidth;

/**
 *  计算文字的大小
 *
 *  @param font  字体
 *  @param maxHeight 约束宽度
 */
- (CGSize)zb_computeSizeWithFont:(UIFont *)font constrainedMaxHeight:(CGFloat)maxHeight;
@end
