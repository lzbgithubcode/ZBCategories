//
//  NSString+ZBSize.m
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+ZBSize.h"

@implementation NSString (ZBSize)

/**
 * 计算文字的高度
 *
 *  @param font  字体
 *  @param maxWidth 约束宽度
 */
- (CGFloat)zb_computeHeigtWithFont:(UIFont *)font constrainedMaxWidth:(CGFloat)maxWidth
{
    return ceil([self zb_computeSizeWithFont:font constrainedMaxWidth:maxWidth].height);
}

/**
 * 计算文字的宽度
 *
 *  @param font  字体
 *  @param maxHeight 约束宽度
 */
- (CGFloat)zb_computeWidthWithFont:(UIFont *)font constrainedMaxheight:(CGFloat)maxHeight
{
    return ceil([self zb_computeSizeWithFont:font constrainedMaxHeight:maxHeight].width);
}
/**
 *  计算文字的大小
 *
 *  @param font  字体
 *  @param maxWidth 约束宽度
 */
- (CGSize)zb_computeSizeWithFont:(UIFont *)font constrainedMaxWidth:(CGFloat)maxWidth
{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
   CGSize textSize = [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                  options:NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine
                               attributes:attributes
                                  context:nil].size;
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
    
}

/**
 *  计算文字的大小
 *
 *  @param font  字体
 *  @param maxHeight 约束宽度
 */
- (CGSize)zb_computeSizeWithFont:(UIFont *)font constrainedMaxHeight:(CGFloat)maxHeight
{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxHeight)
                                         options:NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingTruncatesLastVisibleLine
                                      attributes:attributes
                                         context:nil].size;
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}
@end
