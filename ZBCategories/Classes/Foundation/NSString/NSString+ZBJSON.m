//
//  NSString+ZBJSON.m
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+ZBJSON.h"

@implementation NSString (ZBJSON)
/**
 *  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)zb_dictionaryValue
{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", self, errorJson);
#endif
    }
    return jsonDict;
}
/**
 字典、数据转json字符串
 
 @param data 数据
 @return 字符串
 */
+ (NSString *)zb_JSONToString:(id)data
{
    if(data == nil) return @"";
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments error:&error];
    if ([jsonData length] > 0 && error == nil){
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    return @"";
}
@end
