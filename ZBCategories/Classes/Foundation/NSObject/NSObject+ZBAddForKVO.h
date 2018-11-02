//
//  NSObject+ZBAddForKVO.h
//  ZBCategories
//
//  Created by lzb on 2018/10/22.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZBAddForKVO)

/**
 增加观察者，使用之后请移除观察者
 removeObserverBlocksForKeyPath
 或者
 cremoveObserverBlocks

 @param keyPath 观察路径
 @param block block
 */
- (void)addObserverBlockForKeyPath:(NSString*)keyPath block:(void (^)(id _Nonnull obj, _Nullable id oldValue, _Nullable id newValue))block;


/**
 移除观察者 - 使用(addObserverBlockForKeyPath: block:)调用

 @param keyPath 路径
 */
- (void)removeObserverBlocksForKeyPath:(NSString*)keyPath;


/**
 移除观察者 - 使用(addObserverBlockForKeyPath: block:)调用
 */
- (void)removeObserverBlocks;
@end

NS_ASSUME_NONNULL_END
