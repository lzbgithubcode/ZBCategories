//
//  NSData+ZBHash.m
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSData+ZBHash.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSData (ZBHash)
/**
 返回小写MD5字符串.
 */
- (NSString *)zb_md5String
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 返回MD5 Data
 */
- (NSData *)zb_md5Data
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

/**
 返回sha1字符
 */
- (NSString *)zb_sha1String
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}
/**
 返回sha1 data
 */
- (NSData *)zb_sha1Data
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA1_DIGEST_LENGTH];
}

/**
 返回sha224字符
 */
- (NSString *)zb_sha224String
{
    unsigned char result[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA224_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA224_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

/**
 返回sha224 data
 */
- (NSData *)zb_sha224Data
{
    unsigned char result[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA224_DIGEST_LENGTH];
}

/**
 返回sha256 字符
 */
- (NSString *)zb_sha256String
{
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

/**
 返回sha256 data
 */
- (NSData *)zb_sha256Data
{
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA256_DIGEST_LENGTH];
}

/**
 返回sha384 string
 */
- (NSString *)zb_sha384String
{
    unsigned char result[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

/**
 返回sha384 data
 */
- (NSData *)zb_sha384Data
{
    unsigned char result[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA384_DIGEST_LENGTH];
}

/**
 返回sha512 string
 */
- (NSString *)zb_sha512String
{
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

/**
 返回sha512 data
 */
- (NSData *)zb_sha512Data
{
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA512_DIGEST_LENGTH];
}


/**
 md5 string.
 @param key  密钥.
 */
- (NSString *)zb_hmacMD5StringWithKey:(NSString *)key
{
   return [self zb_universalMacStringUsingAlg:kCCHmacAlgMD5 withKeyString:key];
}

/**
 md5 data.
 @param key 密钥.
 */
- (NSData *)zb_hmacMD5DataWithKey:(NSData *)key
{
     return [self zb_universalMacDataUsingAlg:kCCHmacAlgMD5 withKey:key];
}

/**
 sha1 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA1StringWithKey:(NSString *)key
{
     return [self zb_universalMacStringUsingAlg:kCCHmacAlgSHA1 withKeyString:key];
}

/**
 sha1 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA1DataWithKey:(NSData *)key
{
    return [self zb_universalMacDataUsingAlg:kCCHmacAlgSHA1 withKey:key];
}

/**
 sha224 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA224StringWithKey:(NSString *)key
{
     return [self zb_universalMacStringUsingAlg:kCCHmacAlgSHA224 withKeyString:key];
}

/**
 sha224 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA224DataWithKey:(NSData *)key
{
    return [self zb_universalMacDataUsingAlg:kCCHmacAlgSHA224 withKey:key];
}

/**
 sha256 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA256StringWithKey:(NSString *)key
{
    return [self zb_universalMacStringUsingAlg:kCCHmacAlgSHA256 withKeyString:key];
}

/**
 sha256 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA256DataWithKey:(NSData *)key
{
   return [self zb_universalMacDataUsingAlg:kCCHmacAlgSHA256 withKey:key];
}

/**
 sha384 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA384StringWithKey:(NSString *)key
{
    return [self zb_universalMacStringUsingAlg:kCCHmacAlgSHA384 withKeyString:key];
}
/**
 sha384 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA384DataWithKey:(NSData *)key
{
    return [self zb_universalMacDataUsingAlg:kCCHmacAlgSHA384 withKey:key];
}

/**
 sha512 string
 @param key 密钥.
 */
- (NSString *)zb_hmacSHA512StringWithKey:(NSString *)key
{
  return [self zb_universalMacStringUsingAlg:kCCHmacAlgSHA512 withKeyString:key];
}

/**
 sha512 data
 @param key  密钥.
 */
- (NSData *)zb_hmacSHA512DataWithKey:(NSData *)key
{
   return [self zb_universalMacDataUsingAlg:kCCHmacAlgSHA512 withKey:key];
}


- (NSData *)zb_universalMacDataUsingAlg:(CCHmacAlgorithm)alg withKey:(NSData *)key {
    
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    CCHmac(alg, [key bytes], key.length, self.bytes, self.length, result);
    return [NSData dataWithBytes:result length:size];
}
- (NSString *)zb_universalMacStringUsingAlg:(CCHmacAlgorithm)alg withKeyString:(NSString *)key {
    
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(alg, cKey, strlen(cKey), self.bytes, self.length, result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:size * 2];
    for (int i = 0; i < size; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}
@end
