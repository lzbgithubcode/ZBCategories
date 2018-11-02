//
//  NSString+ZBBase64.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZBBase64)

/**
 string --> string 换行长度默认64
 
 @return base64后的字符串
 */
+ (nullable NSString *)zb_stringWithBase64EncodedString:(NSString *)string;

/**
 string --> Encoded string 换行长度默认64
 
 @return base64后的字符串
 */
- (NSString *)zb_base64EncodedString;

/**
 string --> Decoded string 换行长度默认64
 
 @return base64后的字符串
 */
- (NSString *)zb_base64DecodedString;

/**
 string --> Decoded data 换行长度默认64
 
 @return base64后的data
 */
- (NSData *)zb_base64DecodedData;


@end
