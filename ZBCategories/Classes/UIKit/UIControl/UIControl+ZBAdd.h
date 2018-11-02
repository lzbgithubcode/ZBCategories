//
//  UIControl+ZBAdd.h
//  ZBCategories
//
//  Created by lzb on 2018/10/23.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ZBAdd)

/**
 增加事件处理 - 事件会保存在数组里面

 @param controlEvents 事件类型
 @param handlerBlock 事件处理
 */
- (void)addTargetForControlEvents:(UIControlEvents)controlEvents handerBlock:(void(^)(id sender))handlerBlock;


/**
  新增事件处理 - 当个事件

 @param controlEvents 事件类型
 @param handlerBlock 事件处理
 */
- (void)setBlockForControlEvents:(UIControlEvents)controlEvents handerBlock:(void(^)(id sender))handlerBlock;

/**
 移除某一个事件
 
 @param controlEvents 事件类型
 */
- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
