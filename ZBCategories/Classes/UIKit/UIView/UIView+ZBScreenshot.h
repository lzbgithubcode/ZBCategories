//
//  UIView+ZBScreenshot.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
// 截图

#import <UIKit/UIKit.h>

@interface UIView (ZBScreenshot)
/**
 View截图
 
 @return UIImage
 */
- (UIImage*)screenshot;


/**
 ScrollView截图 contentOffset
 
 @param contentOffset offset
 @return UIImage
 */
- (UIImage*)screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;


/**
 View按Rect截图
 
 @param frame frame
 @return UIImage
 */
- (UIImage*)screenshotInFrame:(CGRect)frame;


/**
 整个view转成图片
 
 @return UIImage
 */
- (UIImage*)convertToImage;
@end
