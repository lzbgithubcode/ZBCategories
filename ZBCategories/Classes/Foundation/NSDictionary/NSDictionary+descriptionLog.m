//
//  NSDictionary+descriptionLog.m
//  CategoryTest
//
//  Created by lzb on 2018/8/8.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSDictionary+descriptionLog.h"
#import<objc/runtime.h>

@implementation NSDictionary (descriptionLog)
/**
 解决字典输出中文乱码的问题
 
 @return 输出结果
 */
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *string = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        [string appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [string appendString:@"}\n"];
    
    return string;
}

@end
