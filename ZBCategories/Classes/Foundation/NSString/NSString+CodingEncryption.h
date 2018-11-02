//
//  NSString+CodingEncryption.h
//  CategoryTest
//
//  Created by lzb on 2018/8/10.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CodingEncryption)

/**
 *  对url进行中文/标点 编码,eg:空格->%20
 *
 *  @return 编码后字符串
 */
- (NSString *)URLEncodedString;

/**
 *  对url解码,eg:%20->空格
 *
 *  @return 解码后的字符串
 */
- (NSString*)URLDecodedString;


/**
 *  @brief  url query转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)URLParametersforURLQuery;


@end
