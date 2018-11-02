//
//  NSString+SafeAccess.m
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSString+SafeAccess.h"

@implementation NSString (SafeAccess)
- (NSString *)safeSubstringFromIndex:(NSUInteger)fromIndex
{
    if (fromIndex > self.length) {
        return nil;
    } else {
        return [self substringFromIndex:fromIndex];
    }
}

- (NSString *)safeSubstringToIndex:(NSUInteger)toIndex
{
    if (toIndex > self.length) {
        return nil;
    } else {
        return [self substringToIndex:toIndex];
    }
}

- (NSString *)safeSubstringWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location+length > self.length) {
        return nil;
    } else {
        return [self substringWithRange:range];
    }
}

- (NSRange)safeRangeOfString:(NSString *)aString
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString];
    }
}

- (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString options:mask];
    }
}

- (NSString *)safeStringByAppendingString:(NSString *)aString
{
    if (aString == nil) {
        return [self stringByAppendingString:@""];
    } else {
        return [self stringByAppendingString:aString];
    }
}
@end

@implementation NSMutableString (SafeAccess)
- (void)safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    if (aString == nil) {
        return;
    } else if (loc > self.length) {
        return;
    } else {
        [self insertString:aString atIndex:loc];
    }
}

- (void)safeAppendString:(NSString *)aString
{
    if (aString == nil) {
        return;
    } else {
        [self appendString:aString];
    }
}

- (void)safeSetString:(NSString *)aString
{
    if (aString == nil) {
        return;
    } else {
        [self setString:aString];
    }
}

- (NSUInteger)safeReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
    NSUInteger location = searchRange.location;
    NSUInteger length = searchRange.length;
    
    if (target == nil || replacement == nil) {
        return 0;
    } else if (location + length > self.length) {
        return 0;
    } else {
        return [self replaceOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
}

@end
