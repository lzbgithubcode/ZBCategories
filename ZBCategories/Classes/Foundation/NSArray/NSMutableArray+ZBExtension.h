//
//  NSMutableArray+ZBExtension.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ZBExtension)

/**
 移除数组中第一个数据
 */
- (void)removeFirstObject;

/**
 移除数组中第最后数据
 */
- (void)removeLastObject;


/**
 反转数组  e.g  Before @[ @1, @2, @3 ], After @[ @3, @2, @1 ].
 */
- (void)reverse;

/**
 随机排序
 */
- (void)randomSort;
@end
