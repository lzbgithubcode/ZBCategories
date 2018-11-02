//
//  UIButton+ZBIndicator.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIButton+ZBIndicator.h"
#import <objc/runtime.h>

// Associative reference keys.
static NSString *const zb_IndicatorViewKey = @"zb_IndicatorViewKey";
static NSString *const zb_ButtonTextObjectKey = @"zb_ButtonTextObjectKey";

@implementation UIButton (ZBIndicator)
/**
 显示加载动画
 */
- (void)showIndicator
{
    UIActivityIndicatorView *activity  = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activity.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height *0.5);
    [activity startAnimating];
   
    NSString *currentButtonText = self.titleLabel.text;
    objc_setAssociatedObject(self, &zb_ButtonTextObjectKey, currentButtonText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &zb_IndicatorViewKey, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:@"" forState:UIControlStateNormal];
    self.enabled = NO;
    [self addSubview:activity];
    
}


/**
 隐藏加载动画
 */
- (void)hiddenIndicator
{
    NSString *currentButtonText = (NSString *)objc_getAssociatedObject(self, &zb_ButtonTextObjectKey);
    UIActivityIndicatorView *activity = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &zb_IndicatorViewKey);
    [activity stopAnimating];
    [activity removeFromSuperview];
    
     self.enabled = YES;
    [self setTitle:currentButtonText forState:UIControlStateNormal];
   
    
}
@end
