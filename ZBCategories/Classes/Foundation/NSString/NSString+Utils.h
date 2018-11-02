//
//  NSString+Utils.h
//  CategoryTest
//
//  Created by lzb on 2018/8/10.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Utils)
/**
 电话号码中间4位*显示  e.g 135*****262
 @return str
 */
- (NSString*)stringFormatToSecrectPhoneNumber;


/**
 银行卡号中间8位*显示 e.g 220**********1234
 @return str
 */
- (NSString*)stringFormatToSecrectAccount;


/**
 转为手机格式，默认为- e.g 183-5064-3321
 
 @return str
 */
- (NSString*)stringFormatToMobile;



@end
