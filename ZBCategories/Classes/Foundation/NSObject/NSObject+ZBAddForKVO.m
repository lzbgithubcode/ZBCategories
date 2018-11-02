//
//  NSObject+ZBAddForKVO.m
//  ZBCategories
//
//  Created by lzb on 2018/10/22.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSObject+ZBAddForKVO.h"
#import <objc/objc.h>
#import <objc/runtime.h>

static const void *blockDictionary_key;



@interface ZBNSObjectKVOBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(__weak id obj, id oldValue, id newValue);

- (instancetype)initWithBlock:(void (^)(__weak id obj, id oldValue, id newValue))block;

@end

@implementation ZBNSObjectKVOBlockTarget
- (instancetype)initWithBlock:(void (^)(__weak id, id, id))block
{
    if(self = [super init])
    {
        self.block = block;
    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (!self.block) return;
    
    BOOL isPrior = [[change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
    if (isPrior) return;
    
    NSKeyValueChange changeKind = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    if (changeKind != NSKeyValueChangeSetting) return;
    
    id oldVal = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldVal == [NSNull null]) oldVal = nil;
    
    id newVal = [change objectForKey:NSKeyValueChangeNewKey];
    if (newVal == [NSNull null]) newVal = nil;
    
    self.block(object, oldVal, newVal);
}
@end

@implementation NSObject (ZBAddForKVO)

/**
 增加观察者，使用之后请移除观察者
 removeObserverBlocksForKeyPath
 或者
 removeObserverBlocks
 
 @param keyPath 观察路径
 @param block block
 */
- (void)addObserverBlockForKeyPath:(NSString*)keyPath block:(void (^)(id _Nonnull obj, _Nullable id oldValue, _Nullable id newValue))block
{
    if(!keyPath || !block) return;
    ZBNSObjectKVOBlockTarget *target = [[ZBNSObjectKVOBlockTarget alloc]initWithBlock:block];
    NSMutableDictionary *targetdicts = [self allObjectObserverBlocks];
    NSMutableArray *arr = targetdicts[keyPath];
    if (!arr) {
        arr = [[NSMutableArray alloc]init];
        targetdicts[keyPath] = arr;
    }
    [arr addObject:target];
    
    //增加观察者
    [self addObserver:target forKeyPath:keyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
}


/**
 移除观察者 - 使用(addObserverBlockForKeyPath: block:)调用
 
 @param keyPath 路径
 */
- (void)removeObserverBlocksForKeyPath:(NSString*)keyPath
{
    if (!keyPath) return;
    NSMutableDictionary *dic = [self allObjectObserverBlocks];
    NSMutableArray *arr = dic[keyPath];
    [arr enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        [self removeObserver:obj forKeyPath:keyPath];
    }];
    
    [dic removeObjectForKey:keyPath];
}


/**
 移除观察者 - 使用(addObserverBlockForKeyPath: block:)调用
 */
- (void)removeObserverBlocks
{
    NSMutableDictionary *dic = [self allObjectObserverBlocks];
    [dic enumerateKeysAndObjectsUsingBlock: ^(NSString *key, NSArray *arr, BOOL *stop) {
        [arr enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
            [self removeObserver:obj forKeyPath:key];
        }];
    }];
    
    [dic removeAllObjects];
}


#pragma mark - praite
- (NSMutableDictionary *)allObjectObserverBlocks
{
    NSMutableDictionary *dicts = objc_getAssociatedObject(self, &blockDictionary_key);
    if(!dicts){
        dicts = [[NSMutableDictionary alloc]init];
        objc_setAssociatedObject(self, &blockDictionary_key, dicts, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dicts;
}
@end
