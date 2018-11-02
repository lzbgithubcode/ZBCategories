//
//  NSString+ZBHash.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZBHash)
/**
 MD5 string.
 */
- (NSString *)zb_md5String;

/**
 sha1 string.
 */
- (NSString *)zb_sha1String;

/**
 sha224 string.
 */
- (NSString *)zb_sha224String;

/**
 sha256 string
 */
- (NSString *)zb_sha256String;

/**
 sha384 string.
 */
- (NSString *)zb_sha384String;

/**
 sha512 string.
 */
- (NSString *)zb_sha512String;

/**
 md5 string
 @param key 密钥.
 */
- (NSString *)zb_macMD5StringWithKey:(NSString *)key;

/**
 SHA1 string
 @param key 密钥.
 */
- (NSString *)zb_macSHA1StringWithKey:(NSString *)key;

/**
 SHA224 string
 @param key 密钥.
 */
- (NSString *)zb_macSHA224StringWithKey:(NSString *)key;

/**
 SHA256 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA256StringWithKey:(NSString *)key;

/**
 SHA384 string
 @param key 密钥.
 */
- (NSString *)zb_macSHA384StringWithKey:(NSString *)key;

/**
 SHA512 string
 @param key 密钥.
 */
- (NSString *)zb_macSHA512StringWithKey:(NSString *)key;
@end
