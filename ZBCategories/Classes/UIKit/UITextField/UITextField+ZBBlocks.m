//
//  UITextField+ZBBlocks.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UITextField+ZBBlocks.h"
#import <objc/runtime.h>

//代理
static const void *ZBUITextFieldDelegateKey = @"ZBUITextFieldDelegateKey";

//是否允许开始编辑
static const void *ZBUITextFieldShouldBeginEditingKey = @"ZBUITextFieldShouldBeginEditingKey";
//是否允许结束编辑
static const void *ZBUITextFieldShouldEndEditingKey = @"ZBUITextFieldShouldEndEditingKey";
//开始编辑
static const void *ZBUITextFieldDidBeginEditingKey = @"ZBUITextFieldDidBeginEditingKey";
//结束编辑
static const void *ZBUITextFieldDidEndEditingKey = @"ZBUITextFieldDidEndEditingKey";
//是否允许编辑过程操作
static const void *ZBUITextFieldShouldEditingOperationKey = @"ZBUITextFieldShouldEditingOperationKey";
//是否允许返回
static const void *ZBUITextFieldShouldReturnKey = @"ZBUITextFieldShouldReturnKey";
//是否允许清除
static const void *ZBUITextFieldShouldClearnKey = @"ZBUITextFieldShouldClearnKey";

@implementation UITextField (ZBBlocks)

#pragma mark -  Delegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //如果block存在
    if(textField.shouldBegindEditingBlock){
        return  textField.shouldBegindEditingBlock(textField);
    }
    
    //代理会调
    id<UITextFieldDelegate> delegate = objc_getAssociatedObject(self, &ZBUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //如果block存在
    if (textField.shouldEndEditingBlock) {
        return textField.shouldEndEditingBlock(textField);
    }
     //代理回调
    id delegate = objc_getAssociatedObject(self, ZBUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //如果block存在
    if (textField.didBeginEditingBlock) {
        return textField.didBeginEditingBlock(textField);
    }
    //代理回调
    id delegate = objc_getAssociatedObject(self, ZBUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
         [delegate textFieldDidBeginEditing:textField];
    }
   
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //如果block存在
    if (textField.didEndEditingBlock) {
        return textField.didEndEditingBlock(textField);
    }
    //代理回调
    id delegate = objc_getAssociatedObject(self, ZBUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidEndEditing:textField];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //如果block存在
    if (textField.shouldChangeCharactersInRangeBlock) {
        return textField.shouldChangeCharactersInRangeBlock(textField,range,string);
    }
    //代理回调
    id delegate = objc_getAssociatedObject(self, ZBUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    //如果block存在
    if (textField.shouldClearBlock) {
        return textField.shouldClearBlock(textField);
    }
    //代理回调
    id delegate = objc_getAssociatedObject(self, ZBUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //如果block存在
    if (textField.shouldReturnBlock) {
        return textField.shouldReturnBlock(textField);
    }
    //代理回调
    id delegate = objc_getAssociatedObject(self, ZBUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}


#pragma mark - set/get
- (BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, &ZBUITextFieldShouldBeginEditingKey);
}

- (void)setShouldBegindEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    [self configDelegateIfNotDelegate];
    objc_setAssociatedObject(self, &ZBUITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL (^)(UITextField *))shouldEndEditingBlock
{
  return objc_getAssociatedObject(self, &ZBUITextFieldShouldEndEditingKey);
}

- (void)setShouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock
{
    [self configDelegateIfNotDelegate];
    objc_setAssociatedObject(self, &ZBUITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITextField *))didBeginEditingBlock
{
  return objc_getAssociatedObject(self, &ZBUITextFieldDidBeginEditingKey);
}
- (void)setDidBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock
{
    [self configDelegateIfNotDelegate];
    objc_setAssociatedObject(self, &ZBUITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITextField *))didEndEditingBlock
{
   return objc_getAssociatedObject(self, &ZBUITextFieldDidEndEditingKey);
}
- (void)setDidEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock
{
    [self configDelegateIfNotDelegate];
    objc_setAssociatedObject(self, &ZBUITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setShouldClearBlock:(BOOL (^)(UITextField *))shouldClearBlock
{
     [self configDelegateIfNotDelegate];
     objc_setAssociatedObject(self, &ZBUITextFieldShouldClearnKey, shouldClearBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (BOOL (^)(UITextField *))shouldClearBlock
{
  return objc_getAssociatedObject(self, &ZBUITextFieldShouldClearnKey);
}
- (void)setShouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock
{
    [self configDelegateIfNotDelegate];
    objc_setAssociatedObject(self, &ZBUITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (BOOL (^)(UITextField *))shouldReturnBlock
{
  return objc_getAssociatedObject(self, &ZBUITextFieldShouldReturnKey);
}

- (void)setShouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    [self configDelegateIfNotDelegate];
    objc_setAssociatedObject(self, &ZBUITextFieldShouldEditingOperationKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    return objc_getAssociatedObject(self, &ZBUITextFieldShouldEditingOperationKey);
}

- (void)configDelegateIfNotDelegate
{
    if(self.delegate != (id<UITextFieldDelegate>)[self class]){
        objc_setAssociatedObject(self, &ZBUITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}
@end
