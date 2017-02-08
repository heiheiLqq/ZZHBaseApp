//
//  UIView+Extension.m
//  BaisibudejieApp
//
//  Created by 庄子豪 on 16/6/3.
//  Copyright © 2016年 zzh. All rights reserved.
//

#import "UIView+Extension.h"

@interface UIView ()

@property void(^clickedAction)(id);

@end

@implementation UIView (Extension)
#pragma mark - set方法重写
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

#pragma mark - 获取view 的get方法重写
- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}


#pragma mark - 任意view添加点击事件
- (void)setClickedAction:(void (^)(id))clickedAction{
     objc_setAssociatedObject(self, @"AddClickedEvent", clickedAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(id))clickedAction{
     return objc_getAssociatedObject(self, @"AddClickedEvent");
}

- (void)addClickedBlock:(void(^)(id obj))clickedAction{
     self.clickedAction = clickedAction;
     // hy:先判断当前是否有交互事件，如果没有的话。。。所有gesture的交互事件都会被添加进gestureRecognizers中
     if (![self gestureRecognizers]) {
         self.userInteractionEnabled = YES;
         // hy:添加单击事件
         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
         [self addGestureRecognizer:tap];
     }
}

- (void)tap{
     if (self.clickedAction) {
         self.clickedAction(self);
     }
}
@end
