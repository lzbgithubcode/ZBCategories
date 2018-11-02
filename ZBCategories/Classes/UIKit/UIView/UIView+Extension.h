//
//  UIView+Extension.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
 清楚子视图
 */
-(void)removeAllSubViews;

/**
 判断View是否在屏幕上
 */
- (BOOL)isDisplayedInScreen;

/**
 子视图失去第一响应
 */
-(void)resAllInputViews;

/**
 当前视图第一响应者
 
 @return view
 */
-(UIView*)findFirstResponder ;

/**
 找到视图所在的第一控制器
 
 @return vc
 */
-(UIViewController *)findViewController;

/**
 根据需求调节圆弧度
 @param Radius 弧度
 @param borderWidth 边宽
 @param color 颜色
 */
- (void)viewRadiusWithRadius:(int )Radius borderWidth:(int )borderWidth color:(UIColor *)color;
@end

