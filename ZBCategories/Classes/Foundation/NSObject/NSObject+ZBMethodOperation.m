//
//  NSObject+ZBMethodOperation.m
//  SMealUserSide
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSObject+ZBMethodOperation.h"
#import <objc/runtime.h>

@implementation NSObject (ZBMethodOperation)

/**
 字典打印模型属性列表 仅调试使用
 */
- (void)zb_printPropertyDescription
{
#ifdef DEBUG
    if (![self isKindOfClass:[NSDictionary class]]) return;
    NSMutableString *description = [NSMutableString string];
    [(NSDictionary *)self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *detail = nil;
        if ([obj isKindOfClass:NSClassFromString(@"__NSDictionaryI")] || [obj isKindOfClass:NSClassFromString(@"__NSDictionary0")]) {
            detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, strong) NSDictionary *%@;\n",key,key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSArrayI")] || [obj isKindOfClass:NSClassFromString(@"__NSArray0")] || [obj isKindOfClass:NSClassFromString(@"__NSArrayM")]) {
            detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/\n@property (nonatomic, strong) NSArray *%@;\n",key,key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            const char *objCtype = [((NSNumber *)obj) objCType];
            if (strcmp(objCtype, @encode(int))  == 0) {
                detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, assign) NSInteger %@;\n",key,key];
            } else if (strcmp(objCtype, @encode(float)) == 0) {
                detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, assign) CGFloat %@;\n",key,key];
            } else if (strcmp(objCtype, @encode(double)) == 0) {
                detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, assign) double %@;\n",key,key];
            } else if (strcmp(objCtype, @encode(long)) == 0) {
                detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, assign) long %@;\n",key,key];
            } else if (strcmp(objCtype, @encode(long long)) == 0) {
                detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, assign) long long %@;\n",key,key];
            } else {
                detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, strong) NSNumber *%@;\n",key,key];
            }
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")] || [obj isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]) {
            detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, copy) NSString *%@;\n",key,key];
        } else if ([obj isKindOfClass:[NSNull class]]) {
            detail = [NSString stringWithFormat:@"\n/**\n %@ 不确定数据类型，该值为null \n*/ \n@property (nonatomic, name) class *%@;\n",key,key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            detail = [NSString stringWithFormat:@"\n/**\n %@ \n*/ \n@property (nonatomic, assign) BOOL %@;\n",key,key];
        }
        NSString *assert = [NSString stringWithFormat:@"没有处理这种类型------>[%@]",[obj class]];
        NSAssert(detail, assert);
        [description appendString:detail];
    }];
    NSLog(@"%@",description);
#endif
}

/**
 运行时更换对象方法
 
 @param originalSel 原始方法
 @param otherSel 交换之后的方法
 */
+ (void)zb_exchangeObjectOriginalMethod:(SEL)originalSel otherMethod:(SEL)otherSel
{
    Method swizzledMethod = class_getInstanceMethod(self, otherSel);
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    BOOL didAddMethod = caddMethod(self, originalSel, swizzledMethod);
    if (didAddMethod) {
        creplaceMethod(self, otherSel, originalMethod);
    } else {
        cswizzleObjectSelector(self, originalSel,otherSel);
    }
}

/**
 运行时更换类方法
 
 @param originalSel 原始方法
 @param otherSel 交换之后的方法
 */
+ (void)zb_exchangeClassOriginalMethod:(SEL)originalSel otherMethod:(SEL)otherSel
{
    Method originalMethod = class_getClassMethod(self, originalSel);
    Method swizzledMethod = class_getClassMethod(self, otherSel);
    BOOL didAddMethod = caddMethod(self, originalSel, swizzledMethod);
    if (didAddMethod) {
        creplaceMethod(self, otherSel, originalMethod);
    } else {
        cswizzleClassSelector(self, originalSel,otherSel);
    }
   
}


#pragma mark - pravite
static inline void cswizzleClassSelector(Class theClass, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getClassMethod(theClass, originalSelector);
    Method swizzledMethod = class_getClassMethod(theClass, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

static inline void cswizzleObjectSelector(Class theClass, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(theClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(theClass, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

static inline BOOL caddMethod(Class theClass, SEL selector, Method method) {
    return class_addMethod(theClass, selector,  method_getImplementation(method),  method_getTypeEncoding(method));
}
static inline void creplaceMethod(Class theClass, SEL swizzledSel, Method originalMethod)
{
    class_replaceMethod(theClass, swizzledSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
}
@end
