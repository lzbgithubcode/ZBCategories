//
//  NSNotificationCenter+ZBAdd.h
//  ZBCategories
//
//  Created by lzb on 2018/10/22.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (ZBAdd)


/**
 主线程发送通知，主线程接收通知

 @param notification 通知名称
 */
- (void)postNotificationOnMainThread:(NSNotification *)notification;

/**
 主线程发送通知，主线程接收通知
 
 @param name 通知名称
 @param object object
 */
- (void)postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object;

/**
 主线程发送通知，主线程接收通知
 
 @param name 通知名称
 @param object object
 @param userInfo userinfo
 */
- (void)postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo;


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
                               waitUntilDone:(BOOL)wait;
@end

NS_ASSUME_NONNULL_END
