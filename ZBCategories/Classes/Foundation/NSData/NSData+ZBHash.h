//
//  NSData+ZBHash.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZBHash)

/**
    返回小写MD5字符串.
 */
- (NSString *)zb_md5String;

/**
    返回MD5 Data
 */
- (NSData *)zb_md5Data;

/**
 返回sha1字符
 */
- (NSString *)zb_sha1String;
/**
 返回sha1 data
 */
- (NSData *)zb_sha1Data;

/**
  返回sha224字符
 */
- (NSString *)zb_sha224String;

/**
 返回sha224 data
 */
- (NSData *)zb_sha224Data;

/**
 返回sha256 字符
 */
- (NSString *)zb_sha256String;

/**
 返回sha256 data
 */
- (NSData *)zb_sha256Data;

/**
 返回sha384 string
 */
- (NSString *)zb_sha384String;

/**
 返回sha384 data
 */
- (NSData *)zb_sha384Data;

/**
 返回sha512 string
 */
- (NSString *)zb_sha512String;

/**
 返回sha512 data
 */
- (NSData *)zb_sha512Data;

/**
  md5 string.
 @param key  密钥.
 */
- (NSString *)zb_hmacMD5StringWithKey:(NSString *)key;

/**
 md5 data.
 @param key 密钥.
 */
- (NSData *)zb_hmacMD5DataWithKey:(NSData *)key;

/**
  sha1 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA1StringWithKey:(NSString *)key;

/**
  sha1 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA1DataWithKey:(NSData *)key;

/**
 sha224 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA224StringWithKey:(NSString *)key;

/**
 sha224 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA224DataWithKey:(NSData *)key;

/**
 sha256 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA256StringWithKey:(NSString *)key;

/**
 sha256 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA256DataWithKey:(NSData *)key;

/**
 sha384 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA384StringWithKey:(NSString *)key;
/**
 sha384 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA384DataWithKey:(NSData *)key;

/**
 sha512 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA512StringWithKey:(NSString *)key;

/**
 sha512 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA512DataWithKey:(NSData *)key;

@end
