//
//  UIAlertController+ZBBlocks.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIAlertController+ZBBlocks.h"

@interface UIAlertController()

@end

@implementation UIAlertController (ZBBlocks)

+ (UIAlertController *)alertCallBackBlock:(UIAlertContollerCallBackBlock)alertViewCallBackBlock
                     title:(NSString *)title
                   message:(NSString *)message
                     style:(UIAlertControllerStyle)style
          cancelButtonName:(NSString *)cancelButtonName
         otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION
{
    

    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    //获取数组的值
      NSMutableArray* arrays = [NSMutableArray array];;
    
    va_list args;
    if(cancelButtonName.length > 0){
       [arrays addObject:cancelButtonName];
    }
    if (otherButtonTitles) {
        [arrays addObject:otherButtonTitles];
        
        va_start(args, otherButtonTitles);
        NSString *other = nil;
        while ((other = va_arg(args, NSString*))) {
            [arrays addObject:other];
        }
        va_end(args);
    }
    
     //创建Action
    NSInteger index = 0;
    for (NSString* title  in arrays){
        UIAlertAction *action = nil;
        if(style == UIAlertControllerStyleActionSheet && index == 0){
            
            action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                if(alertViewCallBackBlock)
                    alertViewCallBackBlock(index);
            }];
        }else{
            action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if(alertViewCallBackBlock)
                    alertViewCallBackBlock(index);
            }];
        }
        
        index++;
        [alertVC addAction:action];
    }
    
    return alertVC;
}
@end
