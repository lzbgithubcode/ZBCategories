//
//  UITextField+ZBInputLimit.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ZBInputLimit)

/**
  限制输入长度，if<=0 没有限制
 */
@property (nonatomic, assign) NSInteger inputMaxLength;


@end
