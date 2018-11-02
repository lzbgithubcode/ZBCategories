//
//  NSString+ZBEncrypt.h
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZBEncrypt)
/**
 *  利用AES - 加密数据
 *
 *  @param key  长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  可以为nil
 *
 *  @return data
 */
- (NSString *)zb_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用AES - 解密数据
 *
 *  @param key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  可以为nil
 *
 *  @return 解密后数据
 */
- (NSString *)zb_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用DES - 加密数据
 *
 *  @param key 长度一般为8
 *  @param iv  可以为nil
 *
 *  @return data
 */
- (NSString *)zb_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用DES - 解密数据
 *
 *  @param key 长度一般为8
 *  @param iv 可以为nil
 *
 *  @return 解密后数据
 */
- (NSString *)zb_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 利用RSA - 加密数据
 
 @param data 原始数据
 @param pubKey 公钥
 @return 加密后的数据
 */
+ (NSString *)zb_encryptData:(NSString *)data publicKey:(NSString *)pubKey;

/**
 利用RSA - 加密数据
 
 @param data 原始数据
 @param privKey 私钥
 @return 加密后的数据
 */
+ (NSString *)zb_encryptData:(NSString *)data privateKey:(NSString *)privKey;

/**
 利用RSA - 解密数据
 
 @param data 加密数据
 @param pubKey 公钥
 @return 解密后的数据
 */
+ (NSString *)zb_decryptData:(NSString *)data publicKey:(NSString *)pubKey;

/**
 利用RSA - 解密数据
 
 @param data 加密数据
 @param privKey 私钥
 @return 解密后的数据
 */
+ (NSString *)zb_decryptData:(NSString *)data privateKey:(NSString *)privKey;
@end
