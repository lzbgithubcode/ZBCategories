//
//  UIBarButtonItem+ZBAdd.m
//  ZBCategories
//
//  Created by lzb on 2018/10/23.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "UIBarButtonItem+ZBAdd.h"
#import <objc/runtime.h>

static const void *block_key;

@interface ZBUIBarButtonItemBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

@end

@implementation ZBUIBarButtonItemBlockTarget
- (id)initWithBlock:(void (^)(id sender))block
{
    if(self = [super init])
    {
        self.block = [block copy];
    }
    return self;
}

- (void)excuteBlock:(id)sender
{
    if(self.block)
        self.block(sender);
}
@end

@implementation UIBarButtonItem (ZBAdd)
/**
 增加事件
 
 @param block block
 */
- (void)addBarButtonItemActionBlock:(void(^)(id sender))block
{
    if(!block) return;
    ZBUIBarButtonItemBlockTarget *target = [[ZBUIBarButtonItemBlockTarget alloc]initWithBlock:block];
    objc_setAssociatedObject(self, &block_key, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTarget:target];
    [self setAction:@selector(excuteBlock:)];
}
- (void (^)(id))actionBlock
{
    ZBUIBarButtonItemBlockTarget *target = objc_getAssociatedObject(self, &block_key);
    return target.block;
}
@end
