//
//  UIView+FrameExt.h
//  CategoryTest
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameExt)
//只能生成get/Set方法声明
@property (nonatomic,assign) CGFloat zb_width;

@property (nonatomic,assign) CGFloat zb_heigth;

@property (nonatomic,assign) CGFloat zb_x;

@property (nonatomic,assign) CGFloat zb_y;


@property (nonatomic,assign) CGFloat zb_centerX;

@property (nonatomic,assign) CGFloat zb_centerY;

@property (nonatomic,assign) CGFloat zb_left;

@property (nonatomic,assign) CGFloat zb_top;

@property (nonatomic,assign) CGFloat zb_right;

@property (nonatomic,assign) CGFloat zb_bottom;

/**
 设置上下左右的距离
 */
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;
@property (readonly) CGPoint topLeft;


/**
 set和get
 */
@property CGFloat height;
@property CGFloat width;
@property CGFloat top;
@property CGFloat left;
@property CGFloat bottom;
@property CGFloat right;
@end
