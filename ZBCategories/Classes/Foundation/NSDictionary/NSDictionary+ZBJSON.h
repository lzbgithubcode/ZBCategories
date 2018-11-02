//
//  NSDictionary+ZBJSON.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZBJSON)

/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)zb_JSONString;
@end
