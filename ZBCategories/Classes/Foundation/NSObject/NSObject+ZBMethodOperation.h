//
//  NSObject+ZBMethodOperation.h
//  SMealUserSide
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZBMethodOperation)
/**
 字典打印模型属性列表 仅调试使用
 */
- (void)zb_printPropertyDescription;


/**
 运行时更换对象方法

 @param originalSel 原始方法
 @param otherSel 交换之后的方法
 */
+ (void)zb_exchangeObjectOriginalMethod:(SEL)originalSel otherMethod:(SEL)otherSel;

/**
 运行时更换类方法

 @param originalSel 原始方法
 @param otherSel 交换之后的方法
 */
+ (void)zb_exchangeClassOriginalMethod:(SEL)originalSel otherMethod:(SEL)otherSel;
@end
