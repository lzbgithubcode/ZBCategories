//
//  UIWindow+ZBHierarchy.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIWindow+ZBHierarchy.h"

@implementation UIWindow (ZBHierarchy)
/**
 顶层控制器
 */
- (UIViewController*)topViewController
{
     UIViewController *topController = [self rootViewController];
    
    while ([topController presentedViewController]) {
        topController = [topController presentedViewController];
    }
     return topController;
}

/**
 当前控制器
 */
- (UIViewController*)currentViewController
{
    UIViewController *currentViewController = [self topViewController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}
@end
