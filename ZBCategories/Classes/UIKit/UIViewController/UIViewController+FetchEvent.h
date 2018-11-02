//
//  UIViewController+FetchEvent.h
//  ATBSecurity
//
//  Created by lzb on 2018/6/4.
//  Copyright © 2018年 ATBSecurity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FetchEvent)

/**
 获取UIWindows上面present的控制器
 */
- (UIViewController *)getPresentedViewController;

/**
 获取UIWindows上面最顶层的控制器
 */
- (UIViewController *)getCurrentViewController;

/**
 获取当前windows
 */
- (UIWindow *)getCurrentWindow;
@end
