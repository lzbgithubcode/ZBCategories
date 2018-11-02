//
//  UIView+TBBadge.h
//  PromptVC
//
//  Created by lzb on 2017/12/26.
//  Copyright © 2017年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TBBadge)

/**
 *  显示小红点
 */
- (void)showBadge;

/**
 * 显示几个小红点儿
 * parameter redCount 小红点儿个数
 */
- (void)showBadgeWithCount:(NSInteger)redCount;
/**
 *针对按钮
 显示几个小红点儿
 * parameter redCount 小红点儿个数
 */
- (void)showBadgeBtnWithCount:(NSInteger)redCount;

/**
 *  隐藏小红点
 */
- (void)hidenBadge;

@end

