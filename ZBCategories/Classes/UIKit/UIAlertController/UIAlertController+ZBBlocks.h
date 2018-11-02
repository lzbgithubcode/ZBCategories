//
//  UIAlertController+ZBBlocks.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertContollerCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertController (ZBBlocks)


/**
 快速创建系统弹框

 @param alertViewCallBackBlock 弹框回调
 @param title 标题
 @param message 提示
 @param style styple
 @param cancelButtonName 取消
 @param otherButtonTitles 其他文字
 @return 实例
 */
+ (UIAlertController *)alertCallBackBlock:(UIAlertContollerCallBackBlock)alertViewCallBackBlock
                     title:(NSString *)title
                   message:(NSString *)message
                     style:(UIAlertControllerStyle)style
          cancelButtonName:(NSString *)cancelButtonName
         otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;
@end
