//
//  NSData+ZBGzip.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZBGzip)

/**
 *  zip压缩 压缩级别 默认-1
 *
 *  @return 压缩后的数据
 */
- (NSData *)zb_gzippComperssedData;

/**
  zip压缩

 @param level 压缩级别
 @return 压缩后的data
 */
- (NSData *)zb_gzippedDataWithCompressionLevel:(float)level;


/**
    zip解压
 *  @return 解压后数据
 */
- (NSData *)zb_zippDecompressdData;



/**
 zlib 压缩

 @return 压缩后的数据
 */
- (NSData *)zb_zlibComperssData;
/**
 zlib 解压缩
 
 @return 解压缩后的数据
 */
- (NSData *)zb_zlibDecompressData;

@end
