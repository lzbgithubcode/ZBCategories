//
//  NSObject+ZBCategory.m
//  CategoryTest
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSObject+ZBCategory.h"

static char const associatedObjectNamesKey;

@implementation NSObject (ZBCategory)
- (void)setAssociatedObjectNames:(NSMutableArray *)associatedObjectNames
{
    objc_setAssociatedObject(self, &associatedObjectNamesKey, associatedObjectNames, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableArray *)associatedObjectNames
{
    NSMutableArray *array = objc_getAssociatedObject(self, &associatedObjectNamesKey);
    if (!array) {
        array = [NSMutableArray array];
        [self setAssociatedObjectNames:array];
    }
    return array;
}
- (void)objc_setAssociatedObject:(NSString *)propertyName value:(id _Nullable)value policy:(objc_AssociationPolicy)policy
{
    objc_setAssociatedObject(self, (__bridge objc_objectptr_t)propertyName, value, policy);
    [self.associatedObjectNames addObject:propertyName];
}
- (id)objc_getAssociatedObject:(NSString *)propertyName
{
    return objc_getAssociatedObject(self, (__bridge objc_objectptr_t)propertyName);
}
- (void)objc_removeAssociatedObjects
{
    [self.associatedObjectNames removeAllObjects];
    objc_removeAssociatedObjects(self);
}
@end
