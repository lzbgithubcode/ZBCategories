//
//  NSNotificationCenter+ZBAdd.m
//  ZBCategories
//
//  Created by lzb on 2018/10/22.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSNotificationCenter+ZBAdd.h"
#include <pthread.h>

@implementation NSNotificationCenter (ZBAdd)
/**
 主线程发送通知，主线程接收通知
 
 @param notification 通知名称
 */
- (void)postNotificationOnMainThread:(NSNotification *)notification
{
    if (pthread_main_np()) return [self postNotification:notification];
    [[self class] performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:NO];
}

/**
 主线程发送通知，主线程接收通知
 
 @param name 通知名称
 @param object object
 */
- (void)postNotificationOnMainThreadWithName:(NSString *)name
                                         object:(nullable id)object
{
    if (pthread_main_np()) return [self postNotificationName:name object:object userInfo:nil];
    [self postNotificationOnMainThreadWithName:name object:object userInfo:nil waitUntilDone:NO];
}

/**
 主线程发送通知，主线程接收通知
 
 @param name 通知名称
 @param object object
 @param userInfo userinfo
 */
- (void)postNotificationOnMainThreadWithName:(NSString *)name
                                         object:(nullable id)object
                                       userInfo:(nullable NSDictionary *)userInfo
{
    if (pthread_main_np()) return [self postNotificationName:name object:object userInfo:userInfo];
    [self postNotificationOnMainThreadWithName:name object:object userInfo:userInfo waitUntilDone:NO];
}


/**
 主线程发送通知，主线程接收通知
 
 @param name 通知名称
 @param object object
 @param userInfo userinfo
 @param wait YES 立刻响应  NO 加入RunLoop队列在合适的时候响应
 */
- (void)postNotificationOnMainThreadWithName:(NSString *)name
                                         object:(nullable id)object
                                       userInfo:(nullable NSDictionary *)userInfo
                                  waitUntilDone:(BOOL)wait
{
    if(pthread_main_np()){
       return [self postNotificationName:name object:object userInfo:userInfo];
    }
    NSMutableDictionary *info = [[NSMutableDictionary allocWithZone:nil] initWithCapacity:3];
    if (name) [info setObject:name forKey:@"name"];
    if (object) [info setObject:object forKey:@"object"];
    if (userInfo) [info setObject:userInfo forKey:@"userInfo"];
    [[self class] performSelectorOnMainThread:@selector(postNotificationName:) withObject:info waitUntilDone:wait];
}

+ (void)postNotification:(NSNotification *)notification {
    [[self defaultCenter] postNotification:notification];
}

+ (void)postNotificationName:(NSDictionary *)info {
    NSString *name = [info objectForKey:@"name"];
    id object = [info objectForKey:@"object"];
    NSDictionary *userInfo = [info objectForKey:@"userInfo"];
    
    [[self defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}
@end
