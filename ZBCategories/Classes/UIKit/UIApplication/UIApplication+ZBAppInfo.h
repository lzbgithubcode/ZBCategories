//
//  UIApplication+ZBAppInfo.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (ZBAppInfo)

/**
 APP 的bundle 名称
 */
@property (nullable, nonatomic, readonly) NSString *appBundleName;

/**
 APP 的bundleID  e.g com.bundID.APP
 */
@property (nullable, nonatomic, readonly) NSString *appBundleID;

/**
 APP 的bundleID  e.g 1.2.0
 */
@property (nullable, nonatomic, readonly) NSString *appVersion;

/**
 APP 的bundleID  e.g 12
 */
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;
@end
