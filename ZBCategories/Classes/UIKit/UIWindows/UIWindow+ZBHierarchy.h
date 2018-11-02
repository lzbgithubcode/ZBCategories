//
//  UIWindow+ZBHierarchy.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (ZBHierarchy)

/**
  顶层控制器
 */
- (UIViewController*)topViewController;

/**
  当前控制器
 */
- (UIViewController*)currentViewController;
@end
