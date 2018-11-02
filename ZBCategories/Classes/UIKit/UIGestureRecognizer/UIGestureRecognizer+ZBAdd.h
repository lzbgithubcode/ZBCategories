//
//  UIGestureRecognizer+ZBAdd.h
//  ZBCategories
//
//  Created by lzb on 2018/10/23.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (ZBAdd)

/**
 初始化手势

 @param handlerBlock 处理事件
 @return 手势
 */
- (instancetype)initWithActionBlock:(void (^)(id sender))handlerBlock;


/**
 增加手势处理

 @param handlerBlock 处理
 */
- (void)addGestureRecognizerActionBlock:(void (^)(id sender))handlerBlock;



/**
 移除手势
 */
- (void)removeAllActionBlocks;
@end
