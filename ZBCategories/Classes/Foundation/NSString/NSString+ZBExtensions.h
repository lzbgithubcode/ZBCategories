//
//  NSString+ZBExtensions.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZBExtensions)
/**
 *  判断URL中是否包含中文
 *  @return 是否包含中文
 */
- (BOOL)isContainChinese;
/**
 *  是否包含空格
 *  @return 是否包含空格
 */
- (BOOL)isContainBlank;
/**
 *  是否包含字符串
 *  @param string 字符串
 *  @return YES, 包含;
 */
- (BOOL)containsaString:(NSString *)string;
/**
 *   获取字符数量
 */
- (long)wordsCount;

/**
 是否不能为空  e.g  @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.

 @return 是否
 */
- (BOOL)isNotBlank;

/**
 *  去掉空白字符
 *
 *  @return str
 */
- (NSString *)wipeBlankString;

/**
 *  去除包裹符 （eg：\xxxx\ ==> xxxx   'xxx' => xxx）
 *
 *  @return str
 */
- (NSString *)wipeUnwrap;


/**
 空判断:对象不是字符串为对象空判断，是字符串则空字符判断
 
 @param checkObj 对象
 @return bool
 */
+(BOOL)checkEmpty:(id)checkObj;


/**
 ///替换字符串
 ///\a - Sound alert
 ///\b - 退格
 ///\f - Form feed
 ///\n - 换行
 ///\r - 回车
 ///\t - 水平制表符
 ///\v - 垂直制表符
 ///\\ - 反斜杠
 ///\" - 双引号
 ///\' - 单引号
 
 @param str 字符串
 @return 结果
 */
- (NSString *)replaceWithstr:(NSString *)str;

@end
