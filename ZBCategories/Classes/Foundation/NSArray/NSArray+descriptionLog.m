//
//  NSArray+descriptionLog.m
//  CategoryTest
//
//  Created by lzb on 2018/8/8.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSArray+descriptionLog.h"

@implementation NSArray (descriptionLog)
/**
 解决数组输出中文乱码的问题
 
 @return 输出结果
 */
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *string = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [string appendFormat:@"\t%@,\n", obj];
    }];
    if ([string hasSuffix:@",\n"]) {
        
        [string deleteCharactersInRange:NSMakeRange(string.length - 2, 1)]; // 删除最后一个逗号
    }
    [string appendString:@")\n"];
    
    return string;
}

@end
