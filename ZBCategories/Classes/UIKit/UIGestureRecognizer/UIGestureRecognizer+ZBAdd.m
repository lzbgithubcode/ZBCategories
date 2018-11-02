//
//  UIGestureRecognizer+ZBAdd.m
//  ZBCategories
//
//  Created by lzb on 2018/10/23.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "UIGestureRecognizer+ZBAdd.h"
#import <objc/runtime.h>

static const void *block_GestureRecognizer_key;

@interface ZBUIGestureRecognizerBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

@end

@implementation ZBUIGestureRecognizerBlockTarget
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
@implementation UIGestureRecognizer (ZBAdd)
/**
 初始化手势
 
 @param handlerBlock 处理事件
 @return 手势
 */
- (instancetype)initWithActionBlock:(void (^)(id sender))handlerBlock
{
    if(self = [self init])
    {
        [self addGestureRecognizerActionBlock:handlerBlock];
    }
    return self;
    
}
/**
 增加手势处理
 
 @param handlerBlock 处理
 */
- (void)addGestureRecognizerActionBlock:(void (^)(id sender))handlerBlock
{
    ZBUIGestureRecognizerBlockTarget *target = [[ZBUIGestureRecognizerBlockTarget alloc]initWithBlock:handlerBlock];
    [self addTarget:target action:@selector(excuteBlock:)];
    NSMutableArray *targets = [self allGestureRecognizerBlockTargets];
    [targets addObject:target];
}


- (void)removeAllActionBlocks{
    NSMutableArray *targets = [self allGestureRecognizerBlockTargets];
    [targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        [self removeTarget:target action:@selector(excuteBlock:)];
    }];
    [targets removeAllObjects];
}
- (NSMutableArray *)allGestureRecognizerBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_GestureRecognizer_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_GestureRecognizer_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}
@end
