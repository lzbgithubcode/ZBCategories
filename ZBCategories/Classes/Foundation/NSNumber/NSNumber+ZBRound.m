//
//  NSNumber+ZBRound.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSNumber+ZBRound.h"

@implementation NSNumber (ZBRound)
/**
 @param digit  限制最大位数
 @param roundingMode  四舍五入模式
 */
- (NSNumber*)zb_handleRoundWithDigit:(NSUInteger)digit mode:(NSNumberRoundingMode)roundingMode
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    switch (roundingMode) {
        case NSNumberRoundingPlain:
            [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
            break;
        case NSNumberRoundingUp:
            [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
            break;
        case NSNumberRoundingDown:
            [formatter setRoundingMode:NSNumberFormatterRoundFloor];
            break;
            
        default:
            break;
    }
    
    [formatter setMaximumFractionDigits:digit];
    [formatter setMinimumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

/**
 
 四舍五入  只舍不入 e.g 1.35 = 1.3
 
 @param digit  限制最大位数
 */
- (NSNumber*)zb_handleRoundDownWithDigit:(NSUInteger)digit
{
    return [self zb_handleRoundWithDigit:digit mode:NSNumberRoundingDown];
}

/**
 
 四舍五入  只入不舍 e.g 1.35 = 1.4
 
 @param digit  限制最大位数
 */
- (NSNumber*)zb_handleRoundUpWithDigit:(NSUInteger)digit
{
    return [self zb_handleRoundWithDigit:digit mode:NSNumberRoundingUp];
}
@end
