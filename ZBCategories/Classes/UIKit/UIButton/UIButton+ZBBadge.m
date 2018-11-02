//
//  UIButton+ZBBadge.m
//  ZBCategories
//
//  Created by lzb on 2018/10/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIButton+ZBBadge.h"
#import <objc/runtime.h>


//lable key
NSString const *zb_UIButton_badgeLableKey = @"zb_UIButton_badgeLableKey";
//偏移量
NSString const *zb_UIButton_badgeLableOffsetKey = @"zb_UIButton_badgeLableOffsetKey";
//原点大小
NSString const *zb_UIButton_badgeLableSizeKey = @"zb_UIButton_badgeLableSizeKey";
//badge type
NSString const *zb_UIButton_badgeLableTypeKey = @"zb_UIButton_badgeLableTypeKey";
//BGColor
NSString const *zb_UIButton_badgeLablezb_badgeBackgroundColorKey = @"zb_UIButton_badgeLablezb_badgeBackgroundColorKey";
//TextColor
NSString const *zb_UIButton_badgeLableTextColorKey = @"zb_UIButton_badgeLableTextColorKey";
//font
NSString const *zb_UIButton_badgeLableTextFontKey = @"zb_UIButton_badgeLableTextFontKey";
//padding
NSString const *zb_UIButton_badgeLableTextPaddingKey = @"zb_UIButton_badgeLableTextPaddingKey";
//value
NSString const *zb_UIButton_badgeLableTextValueKey = @"zb_UIButton_badgeLableTextValueKey";

@interface UIButton()

@property (nonatomic, assign)  UIButtonBadgeType bageType;
@property (nonatomic, strong)  UILabel *badgeLabel;

@end
@implementation UIButton (ZBBadge)

//新增红点 bage
- (void)addRedPointBadge
{
    [self addBadgeWithType:UIButtonBadgeTypePoint Offset:UIOffsetZero size:CGSizeZero];
}

//新增number badge
- (void)addNumberBadge
{
  [self addBadgeWithType:UIButtonBadgeTypeNumberValue Offset:UIOffsetZero size:CGSizeZero];
}
/**
 增加item的角标，默认是右上角，默认的大小5 *5
 默认模式：小红点
 @param offset 偏移量
 @param size 大小
 */
- (void)addBadgeWithType:(UIButtonBadgeType)type Offset:(UIOffset)offset size:(CGSize)size
{
    self.bageType = type;
    self.zb_LabelOffset = offset;
    if(CGSizeEqualToSize(size, CGSizeZero)){
        size = CGSizeMake(5, 5);
    }
    self.zb_LabelSize = size;
    [self addSubview:self.badgeLabel];
    [self zb_setupBadgeInit];
    
}


/**
 更新offset
 
 @param offset offset
 */
- (void)updateBadgeWithOffset:(UIOffset)offset
{
    self.zb_LabelOffset = offset;
}


/**
 更新badgeVaule
 
 @param badgeVaule badgeVaule
 */
- (void)updateBadgeWithVaule:(NSInteger)badgeVaule
{
    self.zb_badgeValue = badgeVaule;
}

/**
 获取BadgeLabelSize
 
 @return size
 */
- (CGSize)fetchBadgeLabelSize
{
    return self.badgeLabel.bounds.size;
}

- (void)zb_setupBadgeInit
{
    if(self.bageType == UIButtonBadgeTypePoint){
        self.badgeLabel.layer.cornerRadius = self.zb_LabelSize.width * 0.5;
        self.badgeLabel.layer.masksToBounds = YES;
    }else{
        self.zb_bagdgeTextColor = [UIColor whiteColor];
        self.zb_bagdgeFont = [UIFont systemFontOfSize:11.0];
        self.zb_badgePadding = 1.0;
    }
    self.zb_badgeBackgroundColor   = [UIColor redColor];
    
}

- (void)zb_refreshBadge
{
    if(self.badgeLabel){
        self.badgeLabel.backgroundColor = self.zb_badgeBackgroundColor;
        if(self.bageType == UIButtonBadgeTypeNumberValue){
            self.badgeLabel.font = self.zb_bagdgeFont;
            self.badgeLabel.textColor = self.zb_bagdgeTextColor;
            //赋值
            if(self.zb_badgeValue == 0){
                self.badgeLabel.hidden = YES;
            }else
            {
                self.badgeLabel.hidden = NO;
                self.badgeLabel.text = [NSString stringWithFormat:@"%ld",self.zb_badgeValue];
            }
        }
    }
}

- (void)zb_refreshBadgeFrame
{
    if(self.badgeLabel && self.superview){
        CGFloat badgeLabelX = self.zb_LabelOffset.horizontal;
        CGFloat badgeLabelY = self.zb_LabelOffset.vertical;
        CGFloat badgeLabelW = 0;
        CGFloat badgeLabelH = 0;
        if(self.bageType == UIButtonBadgeTypeNumberValue){
            [self.badgeLabel sizeToFit];
            CGSize contentSize = [self.badgeLabel.text sizeWithAttributes:@{NSFontAttributeName : self.badgeLabel.font}];
             badgeLabelW = ceil(contentSize.width) + 2 * self.zb_badgePadding;
             badgeLabelH = ceil(contentSize.height) + 2 * self.zb_badgePadding;
            if(badgeLabelW < badgeLabelH){
                badgeLabelW = badgeLabelH;
            }
            self.badgeLabel.frame = CGRectMake(badgeLabelX, badgeLabelY, badgeLabelW, badgeLabelH);
            self.badgeLabel.layer.cornerRadius = badgeLabelW * 0.5;
            self.badgeLabel.layer.masksToBounds = YES;
        }else
        {
             badgeLabelW = self.zb_LabelSize.width;
             badgeLabelH = self.zb_LabelSize.height;;
            self.badgeLabel.frame = CGRectMake(badgeLabelX, badgeLabelY, badgeLabelW, badgeLabelH);
            self.badgeLabel.layer.cornerRadius = badgeLabelH * 0.5;
            self.badgeLabel.layer.masksToBounds = YES;
        }
        
    }
    
}


#pragma mark - lazy

- (UILabel *)badgeLabel
{
    UILabel *_badgeLabel = objc_getAssociatedObject(self, &zb_UIButton_badgeLableKey);
    if(_badgeLabel == nil){
        _badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.zb_LabelSize.width, self.zb_LabelSize.height)];
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        [self setBadgeLabel:_badgeLabel];
        
    }
    return _badgeLabel;
}

- (void)setBadgeLabel:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)setBageType:(UIButtonBadgeType)bageType
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableTypeKey, @(bageType), OBJC_ASSOCIATION_ASSIGN);
}
- (UIButtonBadgeType)bageType
{
    NSNumber *number = objc_getAssociatedObject(self, &zb_UIButton_badgeLableTypeKey);
    return [number integerValue];
}

- (void)setZb_LabelOffset:(UIOffset)zb_LabelOffset
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableOffsetKey, NSStringFromUIOffset(zb_LabelOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self zb_refreshBadgeFrame];
}

- (UIOffset)zb_LabelOffset
{
    NSString *offsetString =  objc_getAssociatedObject(self, &zb_UIButton_badgeLableOffsetKey);
    return UIOffsetFromString(offsetString);
}

- (void)setZb_LabelSize:(CGSize)zb_LabelSize
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableSizeKey, NSStringFromCGSize(zb_LabelSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self zb_refreshBadgeFrame];
}

- (CGSize)zb_LabelSize
{
    NSString *sizeString =  objc_getAssociatedObject(self, &zb_UIButton_badgeLableSizeKey);
    return CGSizeFromString(sizeString);
}

- (void)setZb_badgeBackgroundColor:(UIColor *)zb_badgeBackgroundColor
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLablezb_badgeBackgroundColorKey, zb_badgeBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
     [self zb_refreshBadge];
}

- (UIColor *)zb_badgeBackgroundColor
{
    return objc_getAssociatedObject(self, &zb_UIButton_badgeLablezb_badgeBackgroundColorKey);
}

- (void)setZb_bagdgeTextColor:(UIColor *)zb_bagdgeTextColor
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableTextColorKey, zb_bagdgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self zb_refreshBadge];
}
- (UIColor *)zb_bagdgeTextColor
{
   return objc_getAssociatedObject(self, &zb_UIButton_badgeLableTextColorKey);
}
- (void)setZb_bagdgeFont:(UIFont *)zb_bagdgeFont
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableTextFontKey, zb_bagdgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self zb_refreshBadge];
    [self zb_refreshBadgeFrame];
}
- (UIFont *)zb_bagdgeFont
{
  return objc_getAssociatedObject(self, &zb_UIButton_badgeLableTextFontKey);
}
- (void)setZb_badgePadding:(CGFloat)zb_badgePadding
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableTextPaddingKey, @(zb_badgePadding), OBJC_ASSOCIATION_ASSIGN);
    [self zb_refreshBadge];
    [self zb_refreshBadgeFrame];
}
- (CGFloat)zb_badgePadding
{
    NSNumber *padding =  objc_getAssociatedObject(self, &zb_UIButton_badgeLableTextPaddingKey);
    return [padding floatValue];
}
- (void)setZb_badgeValue:(NSInteger)zb_badgeValue
{
    objc_setAssociatedObject(self, &zb_UIButton_badgeLableTextValueKey, @(zb_badgeValue), OBJC_ASSOCIATION_ASSIGN);
    [self zb_refreshBadge];
    [self zb_refreshBadgeFrame];
}

- (NSInteger)zb_badgeValue
{
    NSNumber *value =  objc_getAssociatedObject(self, &zb_UIButton_badgeLableTextValueKey);
    return [value integerValue];
}
@end
