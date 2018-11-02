//
//  UIButton+ZBImagePosition.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIButton+ZBImagePosition.h"

@implementation UIButton (ZBImagePosition)

/**
 调整图片和文字的排列 - 必须是设置图片和文字之后调用
 
 @param postion ZBImagePosition
 @param spacing 间距
 */
- (void)adjustImagePosition:(ZBImagePosition)postion spacing:(CGFloat)spacing
{
    CGFloat  buttonWidth = self.bounds.size.width;
    CGFloat  buttonHeight = self.bounds.size.height;
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGFloat titleWidth = ceil([self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}].width);
    CGFloat titleHeight = ceil([self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}].height);
    
    switch (postion) {
        case ZBImagePositionLeft:
            {

                self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing*0.5, 0, spacing*0.5);
                self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing*0.5, 0, -spacing*0.5);
            }
            break;
        case ZBImagePositionRight:
            {
                if(titleWidth > buttonWidth - imageWith - spacing){
                    titleWidth = buttonWidth - imageWith - spacing;
                }
                self.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + spacing*0.5, 0, - (titleWidth+spacing*0.5));
                self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWith +spacing*0.5), 0,(imageWith +spacing*0.5));
            }
            break;
        case ZBImagePositionTop:
            {
                if(titleWidth > buttonWidth){
                    titleWidth = buttonWidth;
                }
                
                CGFloat imageTopBottom = (imageHeight*0.5 + spacing*0.5);
                CGFloat titleTopBottom = titleHeight *0.5+spacing*0.5;
                if(buttonHeight < (imageHeight + spacing + titleHeight)){
                    imageTopBottom = titleHeight *0.5 + spacing*0.5;
                    titleTopBottom = imageHeight *0.5+spacing*0.5;
                }
                
                CGFloat imageLeft = (titleWidth+imageWith)*0.5-imageWith*0.5;
                CGFloat titleRight = (titleWidth+imageWith)*0.5-titleWidth*0.5;
                [self setImageEdgeInsets:UIEdgeInsetsMake(-imageTopBottom, imageLeft, imageTopBottom, -imageLeft)];
                [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopBottom, -titleRight, -titleTopBottom, titleRight)];
            }
            break;
        case ZBImagePositionBottom:
            {
                CGFloat space = spacing;
                if(titleWidth > buttonWidth){
                    titleWidth = buttonWidth;
                }
                
                CGFloat imageTopBottom = imageHeight *0.5+space*0.5;
                CGFloat titleTopBottom = titleHeight *0.5+spacing*0.5;
                if(buttonHeight < (imageHeight + spacing + titleHeight)){
                    imageTopBottom = titleHeight *0.5 + spacing*0.5;
                    titleTopBottom = imageHeight *0.5+spacing*0.5;
                }
                
                CGFloat imageLeft = (titleWidth+imageWith)*0.5-imageWith*0.5;
                CGFloat titleRight = (titleWidth+imageWith)*0.5-imageWith*0.5;
                [self setImageEdgeInsets:UIEdgeInsetsMake(imageTopBottom, imageLeft, -imageTopBottom, -imageLeft)];
                [self setTitleEdgeInsets:UIEdgeInsetsMake(-titleTopBottom, -titleRight, titleTopBottom, titleRight)];
            }
            break;
            
        default:
            break;
    }
    
}
@end
