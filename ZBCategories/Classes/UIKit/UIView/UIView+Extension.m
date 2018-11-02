//
//  UIView+Extension.m
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(void)removeAllSubViews{
    NSArray *viewSubViews = [self subviews];
    if (viewSubViews != nil) {
        for (UIView *view in viewSubViews) {
            [view removeFromSuperview];
        }
    }
}

/**
 判断View是否在屏幕上
 */
- (BOOL)isDisplayedInScreen
{
    if (self == nil) {
        return NO;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    CGRect rect = [self convertRect:self.frame fromView:nil];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return NO;
    }
    
    // 若view 隐藏
    if (self.hidden) {
        return NO;
    }
    
    // 若没有superview
    if (self.superview == nil) {
        return NO;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  NO;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return NO;
    }
    
    return YES;
}

-(void)resAllInputViews{
    NSArray *viewSubViews = [self subviews];
    if (viewSubViews != nil) {
        for (UIView *view in viewSubViews) {
            [view resignFirstResponder];
        }
    }
}
-(UIView*)findFirstResponder {
    
    if (self.isFirstResponder) return self;
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        if (firstResponder != nil) return firstResponder;
    }
    return nil;
    
}

/**
 *  找到当前view所在的viewcontroller
 *
 *  @return viewcontroller
 */
-(UIViewController *)findViewController
{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder != nil);
    return nil;
}
- (void)viewRadiusWithRadius:(int )Radius borderWidth:(int )borderWidth color:(UIColor *)color
{
    self.userInteractionEnabled=YES;
    self.layer.cornerRadius=Radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds=YES;
}
@end



