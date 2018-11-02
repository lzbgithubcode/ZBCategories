//
//  UIView+ZBGestureBlocks.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIView+ZBGestureBlocks.h"
#import <objc/runtime.h>

//tap
static  const void *zb_kActionHandlerTapGestureKey = @"zb_kActionHandlerTapGestureKey";

//LongPress
static  const void *zb_kActionHandlerLongPressGestureKey = @"zb_kActionHandlerLongPressGestureKey";

//block
static  const void *zb_kActionHandlerTapBlockKey = @"zb_kActionHandlerTapBlockKey";
//long block
static  const void *zb_kActionHandlerLongPresspBlockKey = @"zb_kActionHandlerLongPresspBlockKey";

@implementation UIView (ZBGestureBlocks)
/**
 新增tap 点击手势
 
 @param block 响应
 */
- (void)zb_addTapGestureActionBlock:(ZBGestureActionBlock)block
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer *)objc_getAssociatedObject(self, &zb_kActionHandlerTapGestureKey);
    if(!tapGesture){
        
        //新增手势
        tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:tapGesture];
        
        objc_setAssociatedObject(self, &zb_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        ZBGestureActionBlock block = objc_getAssociatedObject(self, &zb_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

/**
 新增LongPress 长按手势
 
 @param block 响应
 */
- (void)zb_addLongPressGestureActionBlock:(ZBGestureActionBlock)block
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)objc_getAssociatedObject(self, &zb_kActionHandlerLongPressGestureKey);
    if(!longPress){
        
        //新增手势
        longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:longPress];
        
        objc_setAssociatedObject(self, &zb_kActionHandlerLongPresspBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)handleActionForLongPressGesture:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        ZBGestureActionBlock block = objc_getAssociatedObject(self, &zb_kActionHandlerLongPresspBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
@end
