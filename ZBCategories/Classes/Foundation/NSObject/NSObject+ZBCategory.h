//
//  NSObject+ZBCategory.h
//  CategoryTest
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (ZBCategory)

/**
  分类关联属性数组
 */
@property (nonatomic, strong, readonly) NSMutableArray *associatedObjectNames;
/**
 *  为当前object动态增加属性
 *
 *  @param propertyName 属性名称
 *  @param value  属性值
 *  @param policy 属性内存管理类型
 */
- (void)objc_setAssociatedObject:(NSString *)propertyName value:(id)value policy:(objc_AssociationPolicy)policy;
/**
 *  动态获取当前object某个属性
 *
 *  @param propertyName 属性名称
 *
 *  @return 值
 */
- (id)objc_getAssociatedObject:(NSString *)propertyName;

/**
 *  删除动态增加的属性
 */
- (void)objc_removeAssociatedObjects;


@end
