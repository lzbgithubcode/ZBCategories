//
//  UIButton+ZBImagePosition.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZBImagePosition) {
    ZBImagePositionLeft = 0,              //图片在左，文字在右，默认
    ZBImagePositionRight = 1,             //图片在右，文字在左
    ZBImagePositionTop = 2,               //图片在上，文字在下
    ZBImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (ZBImagePosition)

/**
 调整图片和文字的排列 - 必须是设置图片和文字之后调用

 @param postion ZBImagePosition
 @param spacing 间距
 */
- (void)adjustImagePosition:(ZBImagePosition)postion spacing:(CGFloat)spacing;
@end
