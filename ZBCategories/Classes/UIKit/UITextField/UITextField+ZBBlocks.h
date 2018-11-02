//
//  UITextField+ZBBlocks.h
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ZBBlocks)

/**
  是否允许开始编辑
 */
@property (nonatomic, copy) BOOL (^shouldBegindEditingBlock)(UITextField *textField);
- (void)setShouldBegindEditingBlock:(BOOL (^)(UITextField *textField))shouldBegindEditingBlock;

/**
 是否允许结束编辑
 */
@property ( nonatomic, copy) BOOL (^shouldEndEditingBlock)(UITextField *textField);
- (void)setShouldEndEditingBlock:(BOOL (^)(UITextField *textField))shouldEndEditingBlock;

/**
 开始编辑
 */
@property ( nonatomic, copy) void (^didBeginEditingBlock)(UITextField *textField);
- (void)setDidBeginEditingBlock:(void (^)(UITextField *textField))didBeginEditingBlock;

/**
 结束编辑
 */
@property ( nonatomic, copy) void (^didEndEditingBlock)(UITextField *textField);
- (void)setDidEndEditingBlock:(void (^)(UITextField *textField))didEndEditingBlock;

/**
 编辑过程中操作，是否允许继续编辑
 */
@property ( nonatomic,copy) BOOL (^shouldChangeCharactersInRangeBlock)(UITextField *textField, NSRange range, NSString *replacementString);
- (void)setShouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *textField, NSRange range, NSString *replacementString))shouldChangeCharactersInRangeBlock;

/**
 是否允许返回
 */
@property (nonatomic, copy) BOOL (^shouldReturnBlock)(UITextField *textField);
- (void)setShouldReturnBlock:(BOOL (^)(UITextField *textField))shouldReturnBlock;
/**
 是否允许清除
 */
@property ( nonatomic, copy) BOOL (^shouldClearBlock)(UITextField *textField);
- (void)setShouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock;
@end
