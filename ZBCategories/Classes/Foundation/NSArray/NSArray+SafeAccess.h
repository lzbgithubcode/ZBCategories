//
//  NSArray+SafeAccess.h
//  MyTreasure
//
//  Created by Bryan on 15/11/12.
//  Copyright © 2015年 makervt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (SafeAccess) 

-(id)objectWithIndex:(NSUInteger)index;

- (NSArray *)objectsWithIndexes:(NSIndexSet *)indexes;

- (NSString*)stringWithIndex:(NSUInteger)index;

- (NSNumber*)numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*)arrayWithIndex:(NSUInteger)index;

- (NSDictionary*)dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)integerWithIndex:(NSUInteger)index;

- (BOOL)boolWithIndex:(NSUInteger)index;

- (int16_t)int16WithIndex:(NSUInteger)index;

- (int32_t)int32WithIndex:(NSUInteger)index;

- (int64_t)int64WithIndex:(NSUInteger)index;

- (short)shortWithIndex:(NSUInteger)index;

- (float)floatWithIndex:(NSUInteger)index;

- (double)doubleWithIndex:(NSUInteger)index;

- (NSDate *)dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)pointWithIndex:(NSUInteger)index;

- (CGSize)sizeWithIndex:(NSUInteger)index;

- (CGRect)rectWithIndex:(NSUInteger)index;


#pragma mark - 安全赋值
+ (instancetype)safeArrayWithObject:(id)object;

- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSArray *)safeSubarrayWithRange:(NSRange)range;

- (NSUInteger)safeIndexOfObject:(id)anObject;

@end


#pragma --mark NSMutableArray setter

@interface NSMutableArray(SafeAccess)

-(void)addObj:(id)i;

-(void)addString:(NSString*)i;

-(void)addBool:(BOOL)i;

-(void)addInt:(int)i;

-(void)addInteger:(NSInteger)i;

-(void)addUnsignedInteger:(NSUInteger)i;

-(void)addCGFloat:(CGFloat)f;

-(void)addChar:(char)c;

-(void)addFloat:(float)i;

-(void)addPoint:(CGPoint)o;

-(void)addSize:(CGSize)o;

-(void)addRect:(CGRect)o;


#pragma mark - 安全赋值
- (void)safeAddObject:(id)object;

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index;

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

- (void)safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)safeRemoveObjectsInRange:(NSRange)range;
@end
