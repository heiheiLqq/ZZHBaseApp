//
//  UIBarButtonItem+Extension.h
//  BaisibudejieApp
//
//  Created by 庄子豪 on 16/6/3.
//  Copyright © 2016年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 * 创建导航按钮
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target Action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target Action:(SEL)action Size:(CGSize)size;
@end
