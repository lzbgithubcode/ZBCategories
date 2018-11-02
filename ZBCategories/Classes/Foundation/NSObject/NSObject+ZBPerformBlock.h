//
//  NSObject+ZBPerformBlock.h
//  CategoryTest
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZBPerformBlock)
// try catch
+ (NSException *)tryCatch:(void(^)(void))block;
+ (NSException *)tryCatch:(void(^)(void))block finally:(void(^)(void))aFinisheBlock;

/**
 *  在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 */
+ (void)performInMainThreadExecuteBlock:(void(^)(void))aInMainBlock;
/**
 *  延时在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 *  @param delay        延时时间
 */
+ (void)performInMainThreadExecuteBlock:(void(^)(void))aInMainBlock afterSecond:(NSTimeInterval)delay;
/**
 *  在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 */
+ (void)performInChildThreadExecuteBlock:(void(^)(void))aInThreadBlock;
/**
 *  延时在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 *  @param delay          延时时间
 */
+ (void)performInChildThreadExecuteBlock:(void(^)(void))aInThreadBlock afterSecond:(NSTimeInterval)delay;
@end
