//
//  UIButton+ZBBadge.h
//  ZBCategories
//
//  Created by lzb on 2018/10/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,UIButtonBadgeType)
{
    UIButtonBadgeTypePoint, //点的形式
    UIButtonBadgeTypeNumberValue, //数值的形式
};
@interface UIButton (ZBBadge)

//badge 的背景颜色， 默认红色
@property (nonatomic, strong) UIColor  *zb_badgeBackgroundColor;

//badge 偏移量
@property (nonatomic, assign)  UIOffset zb_LabelOffset;

//badge 的文字颜色， 默认白色 UIButtonBadgeTypeNumberValue 有效
@property (nonatomic, strong) UIColor *zb_bagdgeTextColor;

//badge 的文字字体，默认 12 UIButtonBadgeTypeNumberValue 有效
@property (nonatomic, strong) UIFont *zb_bagdgeFont;

//badge 的文字padding UIButtonBadgeTypeNumberValue 有效
@property (nonatomic, assign) CGFloat zb_badgePadding;

//badge 的value UIButtonBadgeTypeNumberValue 有效
@property (nonatomic, assign) NSInteger zb_badgeValue;

//badge 红点大小 UIButtonBadgeTypePoint 有效
@property (nonatomic, assign)  CGSize zb_LabelSize;


/**
 新增红点 bage
 */
- (void)addRedPointBadge;


/**
 新增number badge
 */
- (void)addNumberBadge;

/**
 增加item的角标，默认是右上角，默认的大小10 *10
 默认模式：小红点
 @param offset 偏移量
 @param size 大小
 */
- (void)addBadgeWithType:(UIButtonBadgeType)type Offset:(UIOffset)offset size:(CGSize)size;


/**
 更新offset

 @param offset offset
 */
- (void)updateBadgeWithOffset:(UIOffset)offset;


/**
 更新badgeVaule

 @param badgeVaule badgeVaule
 */
- (void)updateBadgeWithVaule:(NSInteger)badgeVaule;


/**
 获取BadgeLabelSize

 @return size
 */
- (CGSize)fetchBadgeLabelSize;

@end
