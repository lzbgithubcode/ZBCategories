//
//  NSString+ZBExtensions.m
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+ZBExtensions.h"

@implementation NSString (ZBExtensions)
/**
 *   判断URL中是否包含中文
 *
 *  @return 是否包含中文
 */
- (BOOL)isContainChinese
{
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}
/**
 *  是否包含空格
 *
 *  @return 是否包含空格
 */
- (BOOL)isContainBlank
{
    NSRange range = [self rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}
/**
 *  是否包含字符串
 *
 *  @param string 字符串
 *
 *  @return YES, 包含;
 */
- (BOOL)containsaString:(NSString *)string
{
    NSRange rang = [self rangeOfString:string];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

/**
 *   获取字符数量
 */
- (long)wordsCount
{
    NSInteger n = self.length;
    int i;
    int l = 0, a = 0, b = 0;
    unichar c;
    for (i = 0; i < n; i++)
    {
        c = [self characterAtIndex:i];
        if (isblank(c)) {
            b++;
        } else if (isascii(c)) {
            a++;
        } else {
            l++;
        }
    }
    if (a == 0 && l == 0) {
        return 0;
    }
    return l + (int)ceilf((float)(a + b) / 2.0);
}
/**
 *  去掉空白字符
 *
 *  @return str
 */
- (NSString *)wipeBlankString
{
   return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 *  去除包裹符 （eg：\xxxx\ ==> xxxx   'xxx' => xxx）
 *
 *  @return str
 */
- (NSString *)wipeUnwrap
{
    if ( self.length >= 2 ){
        if ( [self hasPrefix:@"\""] && [self hasSuffix:@"\""] ){
            return [self substringWithRange:NSMakeRange(1, self.length - 2)];
        }
        
        if ( [self hasPrefix:@"'"] && [self hasSuffix:@"'"] ){
            return [self substringWithRange:NSMakeRange(1, self.length - 2)];
        }
    }
    return self;
}

/**
 空判断:对象不是字符串为对象空判断，是字符串则空字符判断
 
 @param checkObj 对象
 @return bool
 */
+(BOOL)checkEmpty:(id)checkObj
{
    if (nil == checkObj || [checkObj isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([checkObj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)checkObj;
        NSString *strWithoutWhitespace = [str wipeBlankString];
        if ([@"(null)" isEqualToString:str]){
            return YES;
        }
        if ([strWithoutWhitespace length] == 0) {
            return YES;
        }
    }
    
    if ([checkObj isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)checkObj;
        if (!([arr count] > 0)) {
            return YES;
        }
    }
    
    return NO;
}
/**
 ///替换字符串
 ///\a - Sound alert
 ///\b - 退格
 ///\f - Form feed
 ///\n - 换行
 ///\r - 回车
 ///\t - 水平制表符
 ///\v - 垂直制表符
 ///\\ - 反斜杠
 ///\" - 双引号
 ///\' - 单引号
 
 @param str 字符串
 @return 结果
 */
- (NSString *)replaceWithstr:(NSString *)str;
{
    if(str.length == 0) return nil;
    NSMutableString *responseString = [NSMutableString stringWithString:str];
    NSString *character = nil;
    for (int i = 0; i < responseString.length; i++) {
        character = [responseString substringWithRange:NSMakeRange(i, 1)];
        if ([character isEqualToString:@"\n"])
            [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
    }
    
    return responseString;
}
@end
