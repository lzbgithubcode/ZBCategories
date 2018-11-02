//
//  NSArray+SafeAccess.m
//  MyTreasure
//
//  Created by Bryan on 15/11/12.
//  Copyright © 2015年 makervt. All rights reserved.
//

#import "NSArray+SafeAccess.h"

@implementation NSArray (SafeAccess)

-(id)objectWithIndex:(NSUInteger)index{
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
}

- (NSArray *)objectsWithIndexes:(NSIndexSet *)indexes
{
    NSMutableArray *result = [NSMutableArray array];
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        if (self.count > idx) {
            [result addObject:self[idx]];
        }
    }];
    return result;
}

- (NSString*)stringWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return @"";
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}


- (NSNumber*)numberWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)decimalNumberWithIndex:(NSUInteger)index{
    id value = [self objectWithIndex:index];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray*)arrayWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}


- (NSDictionary*)dictionaryWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)integerWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
/*
- (NSUInteger)unsignedIntegerWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}
 */
- (BOOL)boolWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)int16WithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)int32WithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)int64WithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

/**
- (char)charWithIndex:(NSUInteger)index{
    
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}
*/

- (short)shortWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)floatWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)doubleWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (NSDate *)dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

//CG
- (CGFloat)CGFloatWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    CGFloat f = [value doubleValue];
    
    return f;
}

- (CGPoint)pointWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    CGPoint point = CGPointFromString(value);
    
    return point;
}
- (CGSize)sizeWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    CGSize size = CGSizeFromString(value);
    
    return size;
}
- (CGRect)rectWithIndex:(NSUInteger)index
{
    id value = [self objectWithIndex:index];
    
    CGRect rect = CGRectFromString(value);
    
    return rect;
}

#pragma mark - 安全赋值
+ (instancetype)safeArrayWithObject:(id)object
{
    if (object == nil) {
        return [self array];
    } else {
        return [self arrayWithObject:object];
    }
}


- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    } else {
        return [self objectAtIndex:index];
    }
}

- (NSUInteger)safeIndexOfObject:(id)anObject
{
    if (anObject == nil) {
        return NSNotFound;
    } else {
        return [self indexOfObject:anObject];
    }
}

- (NSArray *)safeSubarrayWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        //超过了边界,就获取从loction开始所有的item
        if ((location + length) > self.count) {
            length = (self.count - location);
            return [self safeSubarrayWithRange:NSMakeRange(location, length)];
        }
        
        return nil;
    }
    else {
        return [self subarrayWithRange:range];
    }
}
@end


#pragma --mark NSMutableArray setter
@implementation NSMutableArray (SafeAccess)
-(void)addObj:(id)i{
    if (i!=nil) {
        [self safeAddObject:i];
    }
}
-(void)addString:(NSString*)i
{
    if (i!=nil) {
        [self safeAddObject:i];
    }
}
-(void)addBool:(BOOL)i
{
    [self safeAddObject:@(i)];
}
-(void)addInt:(int)i
{
    [self safeAddObject:@(i)];
}
-(void)addInteger:(NSInteger)i
{
    [self safeAddObject:@(i)];
}
-(void)addUnsignedInteger:(NSUInteger)i
{
    [self safeAddObject:@(i)];
}
-(void)addCGFloat:(CGFloat)f
{
    [self safeAddObject:@(f)];
}
-(void)addChar:(char)c
{
    [self safeAddObject:@(c)];
}
-(void)addFloat:(float)i
{
    [self safeAddObject:@(i)];
}
-(void)addPoint:(CGPoint)o
{
    [self safeAddObject:NSStringFromCGPoint(o)];
}
-(void)addSize:(CGSize)o
{
    [self safeAddObject:NSStringFromCGSize(o)];
}
-(void)addRect:(CGRect)o
{
    [self safeAddObject:NSStringFromCGRect(o)];
}


#pragma mark - 安全赋值
- (void)safeAddObject:(id)object
{
    if (object == nil) {
        return;
    } else {
        [self addObject:object];
    }
}

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index
{
    if (object == nil) {
        return;
    } else if (index > self.count) {
        return;
    } else {
        [self insertObject:object atIndex:index];
    }
}

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs
{
    NSUInteger firstIndex = indexs.firstIndex;
    if (indexs == nil) {
        return;
    } else if (indexs.count!=objects.count || firstIndex>objects.count) {
        return;
    } else {
        [self insertObjects:objects atIndexes:indexs];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return;
    } else {
        [self removeObjectAtIndex:index];
    }
}

- (void)safeRemoveObjectsInRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        return;
    } else {
        [self removeObjectsInRange:range];
    }
}

@end
