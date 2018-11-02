//
//  NSString+ZBBase64.m
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+ZBBase64.h"
#import "NSData+ZBEncode.h"

@implementation NSString (ZBBase64)
/**
 string --> string 换行长度默认64
 
 @return base64后的字符串
 */
+ (nullable NSString *)zb_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData zb_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

/**
 string --> Encoded string 换行长度默认64
 
 @return base64后的字符串
 */
- (NSString *)zb_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data zb_base64EncodedString];
}

/**
 string --> Decoded string 换行长度默认64
 
 @return base64后的字符串
 */
- (NSString *)zb_base64DecodedString
{
    return [NSString zb_stringWithBase64EncodedString:self];
}

/**
 string --> Decoded data 换行长度默认64
 
 @return base64后的data
 */
- (NSData *)zb_base64DecodedData
{
    return [NSData zb_dataWithBase64EncodedString:self];
}
@end
