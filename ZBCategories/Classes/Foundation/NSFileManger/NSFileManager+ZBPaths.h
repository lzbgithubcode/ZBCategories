//
//  NSFileManager+ZBPaths.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ZBPaths)
/**
 document 文件URL路径
 */
+ (NSURL *)documentURL;

/**
 document 文件path路径
 */
+ (NSString *)documentsPath;

/**
 library 文件URL路径
 */
+ (NSURL *)libraryURL;

/**
 library 文件path路径
 */
+ (NSString *)libraryPath;

/**
 cache 文件URL路径
 */
+ (NSURL *)cachesURL;

/**
 cache 文件path路径
 */
+ (NSString *)cachesPath;


/**
  document 可用空间
 */
+ (double)availableDocumentSpace;

@end
