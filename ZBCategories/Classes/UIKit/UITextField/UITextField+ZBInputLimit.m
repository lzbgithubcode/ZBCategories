//
//  UITextField+ZBInputLimit.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UITextField+ZBInputLimit.h"
#import <objc/runtime.h>

static const void *ZBTextFieldInputLimitMaxLength = @"ZBTextFieldInputLimitMaxLength";

@implementation UITextField (ZBInputLimit)
- (void)setInputMaxLength:(NSInteger)inputMaxLength
{
    objc_setAssociatedObject(self, &ZBTextFieldInputLimitMaxLength, @(inputMaxLength), OBJC_ASSOCIATION_ASSIGN);
     [self addTarget:self action:@selector(monitorTextFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (NSInteger)inputMaxLength
{
    return [objc_getAssociatedObject(self, &ZBTextFieldInputLimitMaxLength) integerValue];
}



- (void)monitorTextFieldTextDidChange
{
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if ( (!position ||!selectedRange) && (self.inputMaxLength > 0 && toBeString.length > self.inputMaxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.inputMaxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.inputMaxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.inputMaxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.inputMaxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
    
    
}
@end
