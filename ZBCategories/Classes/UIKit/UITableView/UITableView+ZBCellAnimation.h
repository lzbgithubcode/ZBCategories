//
//  UITableView+ZBCellAnimation.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZBCellAnimation)

/**
 左侧飞入
 */
- (void)addMoveAnimation;
/**
 透明
 */
- (void)addAlphaAnimation;
/**
 上面掉落
 */
- (void)addFallAnimation;
/**
 抖动动画
 */
- (void)addShakeAnimation;
/**
 翻转动画
 */
- (void)addOverTurnAnimation;   
/**
 从下往上
 */
- (void)addToTopAnimation;
/**
 从上往下弹动动画
 */
- (void)addSpringListAnimation;
/**
 从下往上挤向顶部
 */
- (void)addShrinkToTopAnimation;
/**
 从上往下展开
 */
- (void)addLayDownAnimation;
/**
翻转动画
 */
- (void)addRoteAnimation;
@end
