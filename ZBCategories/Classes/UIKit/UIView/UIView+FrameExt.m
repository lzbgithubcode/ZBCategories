//
//  UIView+FrameExt.m
//  CategoryTest
//
//  Created by lzb on 2018/8/13.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "UIView+FrameExt.h"

@implementation UIView (FrameExt)
-(void)setZb_x:(CGFloat)zb_x
{
    CGRect rect =self.frame;
    rect.origin.x =zb_x;
    self.frame =rect;
}

-(void)setZb_y:(CGFloat)zb_y
{
    CGRect rect =self.frame;
    rect.origin.y =zb_y;
    self.frame =rect;
}

- (void)setZb_width:(CGFloat)zb_width
{
    CGRect rect =self.frame;
    rect.size.width =zb_width;
    self.frame =rect;
}

- (void)setZb_heigth:(CGFloat)zb_heigth
{
    CGRect rect =self.frame;
    rect.size.height =zb_heigth;
    self.frame =rect;
}

- (CGFloat)zb_width
{
    return self.frame.size.width;
}

- (CGFloat)zb_heigth
{
    return self.frame.size.height;
}

- (CGFloat)zb_x
{
    return self.frame.origin.x;
}
- (CGFloat)zb_y
{
    return self.frame.origin.y;
}

- (void)setZb_centerX:(CGFloat)zb_centerX
{
    CGPoint center =self.center;
    center.x =zb_centerX;
    self.center =center;
}

- (void)setZb_centerY:(CGFloat)zb_centerY
{
    CGPoint center =self.center;
    center.y =zb_centerY;
    self.center =center;
}

-(CGFloat)zb_centerX
{
    return self.center.x;
}

- (CGFloat)zb_centerY
{
    return self.center.y;
}

- (void)setZb_left:(CGFloat)zb_left
{
    CGRect frame = self.frame;
    frame.origin.x = zb_left;
    self.frame = frame;
}

- (CGFloat)zb_left{
    return self.frame.origin.x;
}




- (CGFloat)zb_top {
    return self.frame.origin.y;
}
- (void)setZb_top:(CGFloat)zb_top
{
    CGRect frame = self.frame;
    frame.origin.y = zb_top;
    self.frame = frame;
}


- (CGFloat)zb_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZb_right:(CGFloat)zb_right {
    CGRect frame = self.frame;
    frame.origin.x = zb_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)zb_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZb_bottom:(CGFloat)zb_bottom{
    CGRect frame = self.frame;
    frame.origin.y = zb_bottom - frame.size.height;
    self.frame = frame;
}

// Retrieve and set the origin
- (CGPoint) origin
{
    return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}

// Retrieve and set the size
- (CGSize) size
{
    return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

// Query other frame locations
- (CGPoint) bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (CGPoint) topLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}


@end
