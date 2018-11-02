//
//  NSMutableArray+ZBExtension.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSMutableArray+ZBExtension.h"

@implementation NSMutableArray (ZBExtension)
/**
 移除数组中第一个数据
 */
- (void)removeFirstObject
{
    if(self.count > 0){
         [self removeObjectAtIndex:0];
    }
}

/**
 移除数组中第最后数据
 */
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)removeLastObject
{
    if (self.count > 0) {
        [self removeObjectAtIndex:self.count - 1];
    }
}
#pragma clang diagnostic pop


/**
  反转
 */
- (void)reverse
{
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}


/**
 随机排序
 */
- (void)randomSort {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}
@end
