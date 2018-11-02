//
//  CALayer+ZBSnapshot.h
//  ZBCategories
//
//  Created by lzb on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (ZBSnapshot)
/**
 截取Layer 生成图片
 */
- (nullable UIImage *)snapshotImage;

/**
 截取Layer 生成PDF
 */
- (nullable NSData *)snapshotPDF;
@end
