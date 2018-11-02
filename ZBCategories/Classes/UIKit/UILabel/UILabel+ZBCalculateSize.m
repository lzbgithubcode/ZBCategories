//
//  UILabel+ZBCalculateSize.m
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UILabel+ZBCalculateSize.h"

@implementation UILabel (ZBCalculateSize)
/**
 计算文字的size - 单行  优先计算attributedText  次计算text
 @return size
 */
- (CGSize)zb_computeSize
{
    if(self.attributedText){
        return [self.attributedText.string sizeWithAttributes:@{NSFontAttributeName : self.font}];
    }else{
        return [self.text sizeWithAttributes:@{NSFontAttributeName :self.font}];
    }
}
/**
 计算文字的高度  优先计算
 
 @param maxWidth 最大宽度
 @return size
 */
- (CGSize)zb_computeSizeWithMaxWidth:(CGFloat)maxWidth
{
    if(self.attributedText){
        return [self zb_computeSizeForAttributedString:self.attributedText maxWidth:maxWidth];
    }else{
        return [self zb_computeSizeForString:self.text maxWidth:maxWidth];
    }
}

/**
 计算文字的size string
 
 @param string 计算字符串
 @param maxWidth 最大宽度
 @return size
 */
- (CGSize)zb_computeSizeForString:(NSString *)string   maxWidth:(CGFloat)maxWidth
{
    if(string.length == 0){
        return CGSizeZero;
    }else{
      CGSize size = [self zb_computeSizeForAttributedString:[[NSAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName:self.font}]  maxWidth:maxWidth];
        return CGSizeMake(ceil(size.width), ceil(size.height));
    }
    
}

/**
 计算文字的size attributedString
 
 @param attributedString 计算字符串
 @param maxWidth 最大宽度
 @return size
 */
- (CGSize)zb_computeSizeForAttributedString:(NSAttributedString *)attributedString   maxWidth:(CGFloat)maxWidth
{
    if(attributedString.length == 0){
        return CGSizeZero;
    }else{
        CGSize size = [attributedString boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        return CGSizeMake(ceil(size.width), ceil(size.height));
    }
}
@end
