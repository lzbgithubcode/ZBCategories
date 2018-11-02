//
//  NSDecimalNumber+ZBExtensions.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSDecimalNumber+ZBExtensions.h"

@implementation NSDecimalNumber (ZBExtensions)
/**
 *  模式是四舍五入 NSRoundPlain e.g  1.35  =  1.4
 */
- (NSDecimalNumber*)zb_roundPlainToLimitDigit:(NSUInteger)limit
{
    return [self zb_roundToLimitDigit:limit mode:NSRoundPlain];
}
/**
 *  数字处理
 */
- (NSDecimalNumber*)zb_roundToLimitDigit:(NSUInteger)limit mode:(NSRoundingMode)roundingMode
{
//    @param roundingMode 舍入方式
//    @param scale 小数点后舍入值的位数。
//    @param exact 精度错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
//    @param overflow 溢出错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
//    @param underflow 下溢错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
//    @param divideByZero 除以0的错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
//    @return NSDecimalNumberHandler对象
    NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:roundingMode scale:limit raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    
    return [self decimalNumberByRoundingAccordingToBehavior:handler];
}


@end
