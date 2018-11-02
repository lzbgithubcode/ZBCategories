//
//  NSNumber+ZBAdd.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ZBAdd)


/**
 通过string 创建 NSNumber
 
 e.g @"14", @"14.345", @" 0x32", @" .32e12 "...

 @param string 字符串
 @return  NSNumber 可能返回nil
 */
+ (NSNumber *)numberWithString:(NSString *)string;

@end
