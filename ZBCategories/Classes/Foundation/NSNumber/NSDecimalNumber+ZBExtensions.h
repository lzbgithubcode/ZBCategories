//
//  NSDecimalNumber+ZBExtensions.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (ZBExtensions)
/**
 *  模式是四舍五入 NSRoundPlain e.g  1.35  =  1.4
 *
 *  @param limit 限制位数
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)zb_roundPlainToLimitDigit:(NSUInteger)limit;
/**
 *  四舍五入 数字处理
 *
 *  @param limit        限制位数
 *  @param roundingMode
           NSRoundPlain,   // 四舍五入 e.g 1.35  =  1.4
           NSRoundDown,    // 只舍不入 e.g 1.35 = 1.3
           NSRoundUp,      // 只入不舍 e.g 1.35 = 1.4
           NSRoundBankers  // 在四舍五入的基础上加了一个判断：当最后一位为5的时候，只会舍入成偶数 e.g 1.35 = 1.2
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)zb_roundToLimitDigit:(NSUInteger)limit mode:(NSRoundingMode)roundingMode;



@end
