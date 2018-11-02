//
//  NSString+Utils.m
//  CategoryTest
//
//  Created by lzb on 2018/8/10.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)
/**
 电话号码中间4位*显示  e.g 135*****262
 @return str
 */
- (NSString*)stringFormatToSecrectPhoneNumber
{
    if (self.length==11) {
        NSMutableString *newStr = [NSMutableString stringWithString:self];
        NSRange range = NSMakeRange(3, 7);
        [newStr replaceCharactersInRange:range withString:@"*****"];
        return newStr;
    }
    return nil;
}


/**
 银行卡号中间8位*显示 e.g 220**********1234
 @return str
 */
- (NSString*)stringFormatToSecrectAccount
{
    NSMutableString *newStr = [NSMutableString stringWithString:self];
    NSRange range = NSMakeRange(4, 8);
    if (newStr.length>12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
}


/**
 转为手机格式，默认为- e.g 183-5064-3321
 
 @return str
 */
- (NSString*)stringFormatToMobile
{
    if (self.length==11) {
        NSMutableString* value = [[NSMutableString alloc] initWithString:self];
        [value insertString:@"-" atIndex:3];
        [value insertString:@"-" atIndex:8];
        return value;
    }
    
    return nil;
}





@end
