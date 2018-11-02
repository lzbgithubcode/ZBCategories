//
//  NSFileManager+ZBPaths.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSFileManager+ZBPaths.h"

@implementation NSFileManager (ZBPaths)
/**
 document 文件URL路径
 */
+ (NSURL *)documentURL
{
    return [self URLForDirectory:NSDocumentDirectory];
}

/**
 document 文件path路径
 */
+ (NSString *)documentsPath
{
   return [self pathForDirectory:NSDocumentDirectory];;
}

/**
 library 文件URL路径
 */
+ (NSURL *)libraryURL
{
    return [self URLForDirectory:NSLibraryDirectory];
}

/**
 document 文件path路径
 */
+ (NSString *)libraryPath
{
   return [self pathForDirectory:NSLibraryDirectory];
}

/**
 cache 文件URL路径
 */
+ (NSURL *)cachesURL
{
  return [self URLForDirectory:NSCachesDirectory];
}

/**
 cache 文件path路径
 */
+ (NSString *)cachesPath
{
  return [self pathForDirectory:NSCachesDirectory];
}

+ (double)availableDocumentSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.documentsPath error:nil];
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}


+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES).firstObject;
}
+ (NSURL *)URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}
@end
