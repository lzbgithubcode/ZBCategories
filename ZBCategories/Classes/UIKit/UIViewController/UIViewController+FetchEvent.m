//
//  UIViewController+FetchEvent.m
//  ATBSecurity
//
//  Created by lzb on 2018/6/4.
//  Copyright © 2018年 ATBSecurity. All rights reserved.
//

#import "UIViewController+FetchEvent.h"

@implementation UIViewController (FetchEvent)
//获取当前屏幕中present出来的viewcontroller。
- (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}


/**
 获取UIWindows上面最顶层的控制器
 */
- (UIViewController *)getCurrentViewController
{
    UIWindow *currentWindow = [self getCurrentWindow];
    
    UIViewController *rootViewController = currentWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentViewControllerFromRootVC:rootViewController];
    
    return currentVC;
}

/**
 获取当前windows
 */
- (UIWindow *)getCurrentWindow
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}
- (UIViewController *)getCurrentViewControllerFromRootVC:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentViewControllerFromRootVC:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentViewControllerFromRootVC:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}
@end
