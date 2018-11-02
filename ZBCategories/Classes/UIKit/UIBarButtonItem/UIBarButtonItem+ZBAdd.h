//
//  UIBarButtonItem+ZBAdd.h
//  ZBCategories
//
//  Created by lzb on 2018/10/23.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZBAdd)

/**
 增加事件

 @param block block
 */
- (void)addBarButtonItemActionBlock:(void(^)(id sender))block;
@end
