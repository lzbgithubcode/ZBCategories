//
//  NSArray+ZBExtension.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZBExtension)

/**
通过plist 创建数组

 @param plist 文件名
 @return NSArray
 */
+ (nullable NSArray *)arrayWithPlistString:(NSString *)plist;


/**
 通过plist data 创建数组

 @param plist data
 @return NSArray
 */
+ (NSArray *)arrayWithPlistData:(NSData *)plist;
@end
