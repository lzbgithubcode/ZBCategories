//
//  NSData+ZBEncode.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//  数据转化

#import <Foundation/Foundation.h>

@interface NSData (ZBEncode)
/**
  data -> string  UTF8 字符串
 */
- (NSString *)zb_UTF8String;

/**
 data - > 16进制字符串
 */
- (NSString *)zb_hexString;


/**
 16进制字符串 -> data

 @param hexString 字符串
 @return data
 */
+ (NSData *)zb_dataWithHexString:(NSString *)hexString;


/**
 NSData --> string 换行长度默认64

 @return base64后的字符串
 */
- (NSString *)zb_base64EncodedString;


/**
  字符串 - > base64 ->data

 @param string 传入字符串
 @return 传入字符串 base64后的data
 */
+ (NSData *)zb_dataWithBase64EncodedString:(NSString *)string;
@end
