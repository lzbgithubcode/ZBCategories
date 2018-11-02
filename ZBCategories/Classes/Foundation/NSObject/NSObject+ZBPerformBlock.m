//
//  NSObject+ZBPerformBlock.m
//  CategoryTest
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSObject+ZBPerformBlock.h"

@implementation NSObject (ZBPerformBlock)
// try catch
+ (NSException *)tryCatch:(void(^)(void))block
{
    NSException *result = nil;
    @try{
        if(block){
            block();
        }
    }
    @catch (NSException *error){
        result = error;
    }
    return result;
}
+ (NSException *)tryCatch:(void(^)(void))block finally:(void(^)(void))aFinisheBlock
{
    NSException *result = nil;
    
    @try
    {
        if(block)
            block();
    }
    @catch (NSException *e)
    {
        result = e;
    }
    @finally
    {
        if(aFinisheBlock)
            aFinisheBlock();
    }
    
    return result;
}

/**
 *  在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 */
+ (void)performInMainThreadExecuteBlock:(void(^)(void))aInMainBlock
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if(aInMainBlock)
            aInMainBlock();
        
    });
}
/**
 *  延时在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 *  @param delay        延时时间
 */
+ (void)performInMainThreadExecuteBlock:(void(^)(void))aInMainBlock afterSecond:(NSTimeInterval)delay
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (delay * NSEC_PER_SEC));
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        if(aInMainBlock)
            aInMainBlock();
    });
}
/**
 *  在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 */
+ (void)performInChildThreadExecuteBlock:(void(^)(void))aInThreadBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
         if(aInThreadBlock)
            aInThreadBlock();
        
    });
}
/**
 *  延时在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 *  @param delay          延时时间
 */
+ (void)performInChildThreadExecuteBlock:(void(^)(void))aInThreadBlock afterSecond:(NSTimeInterval)delay
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (delay * NSEC_PER_SEC));
    
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        if(aInThreadBlock)
            aInThreadBlock();
        
    });
}
@end
