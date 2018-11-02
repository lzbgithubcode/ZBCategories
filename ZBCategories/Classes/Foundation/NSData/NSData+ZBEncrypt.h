//
//  NSData+ZBEncrypt.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
// 加密解密

#import <Foundation/Foundation.h>


@interface NSData (ZBEncrypt)
/**
 *  利用AES - 加密数据
 *
 *  @param key  长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  可以为nil
 *
 *  @return data
 */
- (NSData *)zb_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用AES - 解密数据
 *
 *  @param key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  可以为nil
 *
 *  @return 解密后数据
 */
- (NSData *)zb_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用DES - 加密数据
 *
 *  @param key 长度一般为8
 *  @param iv  可以为nil
 *
 *  @return data
 */
- (NSData *)zb_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用DES - 解密数据
 *
 *  @param key 长度一般为8
 *  @param iv 可以为nil
 *
 *  @return 解密后数据
 */
- (NSData *)zb_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;


/**
 利用RSA - 加密数据

 @param data 原始数据
 @param pubKey 公钥
 @return 加密后的数据
 */
+ (NSData *)zb_encryptData:(NSData *)data publicKey:(NSString *)pubKey;

/**
 利用RSA - 加密数据
 
 @param data 原始数据
 @param privKey 私钥
 @return 加密后的数据
 */
+ (NSData *)zb_encryptData:(NSData *)data privateKey:(NSString *)privKey;

/**
 利用RSA - 解密数据
 
 @param data 加密数据
 @param pubKey 公钥
 @return 解密后的数据
 */
+ (NSData *)zb_decryptData:(NSData *)data publicKey:(NSString *)pubKey;

/**
 利用RSA - 解密数据
 
 @param data 加密数据
 @param privKey 私钥
 @return 解密后的数据
 */
+ (NSData *)zb_decryptData:(NSData *)data privateKey:(NSString *)privKey;
@end
