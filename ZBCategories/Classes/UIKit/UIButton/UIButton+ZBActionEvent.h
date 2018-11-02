//
//  UIButton+ZBActionEvent.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonActionCallBack)(UIButton *button);

@interface UIButton (ZBActionEvent)


/**
 增加事件

 @param action 事件block
 @param controlEvents 事件类型
 */
-(void)addButtonAction:(ButtonActionCallBack)action
        forControlEvents:(UIControlEvents)controlEvents;


/**
 增加点击事件 UIControlEventTouchUpInside

 @param action 事件block
 */
-(void)addButtonAction:(ButtonActionCallBack)action;
@end
