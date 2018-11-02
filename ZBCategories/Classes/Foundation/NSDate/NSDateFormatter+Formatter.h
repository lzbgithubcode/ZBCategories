//
//  NSDateFormatter+Formatter.h
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Formatter)
+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

/**
 yyyy-MM-dd HH:mm:ss
 */
+ (id)defaultDateFormatter;
@end
