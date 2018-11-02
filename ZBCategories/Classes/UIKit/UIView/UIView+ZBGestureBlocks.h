//
//  UIView+ZBGestureBlocks.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
// 手势block

#import <UIKit/UIKit.h>

typedef void (^ZBGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (ZBGestureBlocks)

/**
 新增tap 点击手势

 @param block 响应
 */
- (void)zb_addTapGestureActionBlock:(ZBGestureActionBlock)block;

/**
 新增LongPress 长按手势
 
 @param block 响应
 */
- (void)zb_addLongPressGestureActionBlock:(ZBGestureActionBlock)block;

@end
