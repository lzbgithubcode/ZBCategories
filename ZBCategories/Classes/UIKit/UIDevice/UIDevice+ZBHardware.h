//
//  UIDevice+ZBHardware.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
// 获取设备信息

#import <UIKit/UIKit.h>

@interface UIDevice (ZBHardware)

/**
  设备信息 -官方信息
 */
+ (NSString *)devicePlatform;

/**
 设备信息 - 可以看懂的设备型号
 */
+ (NSString *)devicePlatformString;

/**
  是否是模拟器
 */
+ (BOOL)isSimulator;
/**
 是否是ipad
 */
+ (BOOL)isiPad;
/**
 是否是手机
 */
+ (BOOL)isiPhone;

/**
 获取设备名称
 */
+ (NSString *)deviceName;
/**
 获取设备系统版本
 */
+ (NSString *)deviceSystemVersion;

/**
 获取设备语言
 */
+ (NSString *)deviceLanguage;
/**
 获取设备电量
 */
+ (NSString *)deviceBattery;
/**
 获取设备CPU类型
 */
+ (NSString *)deviceCPUType;

/**
 获取设备网络状态
 */
+ (NSString *)deviceNetworkState;
/**
 获取设备IP地址
 */
+ (NSString *)deviceIPAddress;
/**
 获取设备MAC地址
 */
+ (NSString *)deviceMACAddress;

/**
 获取设备的UUID
 */
+ (NSString *)deviceUUID;


/**
 获取手机内存总量, 返回的是字节数
 */
+ (NSUInteger)deviceTotalMemoryBytes;
/**
 获取手机可用内存, 返回的是字节数
 */
+ (NSUInteger)deviceFreeMemoryBytes;


/**
 获取手机硬盘总空间, 返回字符串
 */
+ (NSString *)deviceTotalDiskSpaceBytes;

/**
 获取手机硬盘空闲空间, 返回字符串
 */
+ (NSString *)deviceFreeDiskSpaceBytes;



@end
