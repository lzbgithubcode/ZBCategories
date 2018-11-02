//
//  UIControl+ZBAdd.m
//  ZBCategories
//
//  Created by lzb on 2018/10/23.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "UIControl+ZBAdd.h"
#import <objc/runtime.h>

static const void *blockArray_key;



@interface ZBUIControlBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);
@property (nonatomic, assign) UIControlEvents events;

@end

@implementation ZBUIControlBlockTarget
- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events
{
     if(self = [super  init])
     {
         self.block =  [block copy];;
         self.events = events;
     }
    return self;
}

- (void)excuteBlock:(id)sender
{
    if(self.block)
        self.block(sender);
}
@end
@implementation UIControl (ZBAdd)
/**
 增加事件处理
 
 @param controlEvents 事件类型
 @param handlerBlock 事件处理
 */
- (void)addTargetForControlEvents:(UIControlEvents)controlEvents handerBlock:(void(^)(id sender))handlerBlock
{
    if(!controlEvents || !handlerBlock) return;
    ZBUIControlBlockTarget *target = [[ZBUIControlBlockTarget alloc]initWithBlock:handlerBlock events:controlEvents];
    [self addTarget:target action:@selector(excuteBlock:) forControlEvents:controlEvents];
    NSMutableArray *targetArrays = [self allUIControlBlockTargets];
    [targetArrays addObject:target];
    
}
/**
 新增事件处理 - 当个事件
 
 @param controlEvents 事件类型
 @param handlerBlock 事件处理
 */
- (void)setBlockForControlEvents:(UIControlEvents)controlEvents handerBlock:(void(^)(id sender))handlerBlock
{
    [self removeAllBlocksForControlEvents:UIControlEventAllEvents];
    [self addTargetForControlEvents:controlEvents handerBlock:handlerBlock];
}


/**
 移除所有事件

 @param controlEvents 事件类型
 */
- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents {
    if (!controlEvents) return;
    
    NSMutableArray *targets = [self allUIControlBlockTargets];
    NSMutableArray *removes = [NSMutableArray array];
    for (ZBUIControlBlockTarget *target in targets) {
        if (target.events & controlEvents) {
            UIControlEvents newEvent = target.events & (~controlEvents);
            if (newEvent) {
                [self removeTarget:target action:@selector(excuteBlock:) forControlEvents:target.events];
                target.events = newEvent;
                [self addTarget:target action:@selector(excuteBlock:) forControlEvents:target.events];
            } else {
                [self removeTarget:target action:@selector(excuteBlock:) forControlEvents:target.events];
                [removes addObject:target];
            }
        }
    }
    [targets removeObjectsInArray:removes];
}


- (NSMutableArray *)allUIControlBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &blockArray_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &blockArray_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}
@end
