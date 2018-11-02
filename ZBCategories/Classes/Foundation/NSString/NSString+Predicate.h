//
//  NSString+Predicate.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Predicate)

/**
 有效的电话号码

 @return YES/NO
 */
- (BOOL)isValidMobileNumber;

/**
 有效的邮箱
 
 @return YES/NO
 */
- (BOOL)isValidEmail;

/**
 有效的银行卡号
 
 @return YES/NO
 */
- (BOOL)isValidBankCardNumber;

/**
 有效的字母数字密码
 
 @return YES/NO
 */
- (BOOL)isValidAlphaNumberPassword;

/**
 检测有效身份证 15位
 
 @return YES/NO
 */
- (BOOL)isValidIdentifyFifteen;

/**
 检测有效身份证 18位
 
 @return YES/NO
 */
- (BOOL)isValidIdentifyEighteen;



/**
 *  车牌号的有效性
 */
- (BOOL)isValidCarNumber;


/**
 *  IP地址有效性
 */
- (BOOL)isValidIPAddress;

/**
 *  Mac地址有效性
 */
- (BOOL)isValidMacAddress;

/**
 *  网址有效性
 */
- (BOOL)isValidUrl;


/**
 *  邮政编码
 */
- (BOOL)isValidPostalcode;


/**
 有效的真实姓名
 
 @return YES/NO
 */
- (BOOL)isValidRealName;


/**
 *  纯汉字
 */
- (BOOL)isValidChinese;


/**
 有效的验证码

  @return YES/NO
 */
- (BOOL)isValidVerifyCode;



/**
 限制只能输入数字
 
 @return YES/NO
 */
- (BOOL)isOnlyNumber;

/**
 判断字符串是否为空
 @return 是否
 */
- (BOOL)isBlankString;


/**
 是否是纯数字字符串
 */
- (BOOL)isAllDigits;
@end
