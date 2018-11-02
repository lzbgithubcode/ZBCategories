//
//  NSNumber+ZBRound.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,NSNumberRoundingMode)
{
    NSNumberRoundingPlain = 0, // 四舍五入 e.g 1.35  =  1.4
    NSNumberRoundingDown = 1,   // 只舍不入 e.g 1.35 = 1.3
    NSNumberRoundingUp = 2,  // 只入不舍 e.g 1.35 = 1.4
};

@interface NSNumber (ZBRound)
/**
 
 @param digit  限制最大位数
 @param roundingMode  四舍五入模式
 */
- (NSNumber*)zb_handleRoundWithDigit:(NSUInteger)digit mode:(NSNumberRoundingMode)roundingMode;

/**
 
  四舍五入  只舍不入 e.g 1.35 = 1.3
 
 @param digit  限制最大位数
 */
- (NSNumber*)zb_handleRoundDownWithDigit:(NSUInteger)digit;

/**
 
 四舍五入  只入不舍 e.g 1.35 = 1.4
 
 @param digit  限制最大位数
 */
- (NSNumber*)zb_handleRoundUpWithDigit:(NSUInteger)digit;
@end
