//
//  NSString+ZBEncrypt.m
//  ZBCategories
//
//  Created by lzb on 2018/11/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+ZBEncrypt.h"
#import "NSData+ZBEncrypt.h"
#import "NSData+ZBEncode.h"
#import "NSString+ZBBase64.h"

@implementation NSString (ZBEncrypt)
/**
 *  利用AES - 加密数据
 *
 *  @param key  长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  可以为nil
 *
 *  @return data
 */
- (NSString *)zb_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv
{
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] zb_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted zb_base64EncodedString];
    
    return encryptedString;
}
/**
 *  利用AES - 解密数据
 *
 *  @param key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  可以为nil
 *
 *  @return 解密后数据
 */
- (NSString *)zb_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv
{
    NSData *decrypted = [[NSData zb_dataWithBase64EncodedString:self] zb_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}
/**
 *  利用DES - 加密数据
 *
 *  @param key 长度一般为8
 *  @param iv  可以为nil
 *
 *  @return data
 */
- (NSString *)zb_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv
{
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] zb_encryptedWithDESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted zb_base64EncodedString];
    
    return encryptedString;
}
/**
 *  利用DES - 解密数据
 *
 *  @param key 长度一般为8
 *  @param iv 可以为nil
 *
 *  @return 解密后数据
 */
- (NSString *)zb_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv
{
    NSData *decrypted = [[NSData zb_dataWithBase64EncodedString:self] zb_decryptedWithDESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}
/**
 利用RSA - 加密数据
 
 @param data 原始数据
 @param pubKey 公钥
 @return 加密后的数据
 */
+ (NSString *)zb_encryptData:(NSString *)data publicKey:(NSString *)pubKey
{
    NSData *encry =[NSData zb_encryptData:[data dataUsingEncoding:NSUTF8StringEncoding] publicKey:pubKey];
    NSString *encryString = [[NSString alloc] initWithData:encry encoding:NSUTF8StringEncoding];
    return encryString;
}

/**
 利用RSA - 加密数据
 
 @param data 原始数据
 @param privKey 私钥
 @return 加密后的数据
 */
+ (NSString *)zb_encryptData:(NSString *)data privateKey:(NSString *)privKey
{
    NSData *encry =[NSData zb_encryptData:[data dataUsingEncoding:NSUTF8StringEncoding] privateKey:privKey];
    NSString *encryString = [[NSString alloc] initWithData:encry encoding:NSUTF8StringEncoding];
    return encryString;
}

/**
 利用RSA - 解密数据
 
 @param data 加密数据
 @param pubKey 公钥
 @return 解密后的数据
 */
+ (NSString *)zb_decryptData:(NSString *)data publicKey:(NSString *)pubKey
{
    NSData *encry =[NSData zb_decryptData:[data dataUsingEncoding:NSUTF8StringEncoding] publicKey:pubKey];
    NSString *encryString = [[NSString alloc] initWithData:encry encoding:NSUTF8StringEncoding];
    return encryString;
}

/**
 利用RSA - 解密数据
 
 @param data 加密数据
 @param privKey 私钥
 @return 解密后的数据
 */
+ (NSString *)zb_decryptData:(NSString *)data privateKey:(NSString *)privKey
{
    NSData *encry =[NSData zb_decryptData:[data dataUsingEncoding:NSUTF8StringEncoding] privateKey:privKey];
    NSString *encryString = [[NSString alloc] initWithData:encry encoding:NSUTF8StringEncoding];
    return encryString;
}
@end
