//
//  UIView+Extension.h
//  BaisibudejieApp
//
//  Created by 庄子豪 on 16/6/3.
//  Copyright © 2016年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat centerX;
/***
 *给任意view添加点击事件
 */
- (void)addClickedBlock:(void(^)(id obj))tapAction;

@end
