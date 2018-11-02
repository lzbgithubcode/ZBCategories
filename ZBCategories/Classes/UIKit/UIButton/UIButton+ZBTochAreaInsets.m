//
//  UIButton+ZBTochAreaInsets.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIButton+ZBTochAreaInsets.h"
#import <objc/runtime.h>
static NSString *const ZBTochAreaInsetskey = @"ZBTochAreaInsetskey";

@implementation UIButton (ZBTochAreaInsets)

- (void)setZb_touchAreaInsets:(UIEdgeInsets)zb_touchAreaInsets
{
    NSValue *vaule = [NSValue valueWithUIEdgeInsets:zb_touchAreaInsets];
    objc_setAssociatedObject(self, &ZBTochAreaInsetskey, vaule, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)zb_touchAreaInsets
{
    return [objc_getAssociatedObject(self, &ZBTochAreaInsetskey) UIEdgeInsetsValue];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets edgeInset = self.zb_touchAreaInsets;
    CGRect rect= self.bounds;
    rect = CGRectMake(rect.origin.x - edgeInset.left,
                      rect.origin.y - edgeInset.top,
                      rect.size.width + edgeInset.right + edgeInset.left,
                      rect.size.height + edgeInset.top + edgeInset.bottom);
    return CGRectContainsPoint(rect, point);
}
@end
