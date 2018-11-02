//
//  UILabel+ZBCalculateSize.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZBCalculateSize)
/**
 计算文字的size - 单行  优先计算attributedText  次计算text
 @return size
 */
- (CGSize)zb_computeSize;


/**
 计算文字的size - 多行  优先计算attributedText  次计算text

 @param maxWidth 最大宽度
 @return size
 */
- (CGSize)zb_computeSizeWithMaxWidth:(CGFloat)maxWidth;


/**
 计算文字的size - 多行  string

 @param string 计算字符串
 @param maxWidth 最大宽度
 @return size
 */
- (CGSize)zb_computeSizeForString:(NSString *)string   maxWidth:(CGFloat)maxWidth;

/**
 计算文字的size - 多行  attributedString
 
 @param attributedString 计算字符串
 @param maxWidth 最大宽度
 @return size
 */
- (CGSize)zb_computeSizeForAttributedString:(NSAttributedString *)attributedString   maxWidth:(CGFloat)maxWidth;
@end
