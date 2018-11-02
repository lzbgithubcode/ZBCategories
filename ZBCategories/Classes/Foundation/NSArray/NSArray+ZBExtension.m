//
//  NSArray+ZBExtension.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSArray+ZBExtension.h"

@implementation NSArray (ZBExtension)
/**
 加载plist 文件路径
 
 @param plist 文件名
 @return 数组
 */
+ (nullable NSArray *)arrayWithPlistString:(NSString *)plist
{
    if (!plist) return nil;
    NSData *data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithPlistData:data];
}

+ (NSArray *)arrayWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSArray *array = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListImmutable format:NULL error:NULL];
    if ([array isKindOfClass:[NSArray class]]) return array;
    return nil;
}
@end
