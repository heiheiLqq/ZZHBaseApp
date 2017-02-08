//
//  UIBarButtonItem+Extension.m
//  BaisibudejieApp
//
//  Created by 庄子豪 on 16/6/3.
//  Copyright © 2016年 zzh. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Extension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target Action:(SEL)action
{
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    titleBtn.bounds = (CGRect){0,0,50,40};
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // [titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [titleBtn setTitle:title forState:UIControlStateNormal];
    
    [titleBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:titleBtn];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target Action:(SEL)action Size:(CGSize)size
{
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    titleBtn.bounds = (CGRect){0,0,size};
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [titleBtn setTitle:title forState:UIControlStateNormal];
    
    [titleBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:titleBtn];
    
}
@end
