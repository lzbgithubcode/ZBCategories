//
//  UIButton+ZBActionEvent.m
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "UIButton+ZBActionEvent.h"
#import <objc/runtime.h>

static NSString *keyOfUseCategoryMethod;//用分类方法创建的button，关联对象的key

@interface UIButton()

@property (nonatomic, copy)  ButtonActionCallBack actionBlock;

@end


@implementation UIButton (ZBActionEvent)
-(void)addButtonAction:(ButtonActionCallBack)action
{
    [self addButtonAction:action forControlEvents:UIControlEventTouchUpInside];
}
-(void)addButtonAction:(ButtonActionCallBack)action
      forControlEvents:(UIControlEvents)controlEvents
{
    self.actionBlock = action;
    [self addTarget:self action:@selector(buttonActionEvent) forControlEvents:controlEvents];
}

- (void)buttonActionEvent{
    if (self.actionBlock) {
        self.actionBlock(self);
    }
}

- (void)setActionBlock:(ButtonActionCallBack)actionBlock
{
    objc_setAssociatedObject (self , &keyOfUseCategoryMethod , actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
}
- (ButtonActionCallBack)actionBlock
{
    return objc_getAssociatedObject (self , &keyOfUseCategoryMethod);
}
@end
