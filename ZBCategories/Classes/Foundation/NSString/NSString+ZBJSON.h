//
//  NSString+ZBJSON.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
// 字符串 - > JSON

#import <Foundation/Foundation.h>

@interface NSString (ZBJSON)
/**
 *  JSON字符串 -> NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)zb_dictionaryValue;

/**
 字典、数据 -> json字符串
 
 @param data 数据
 @return 字符串
 */
+ (NSString *)zb_JSONToString:(id)data;

@end
