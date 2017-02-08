//
//  UINavigationBar+Extension.h
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/8.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Extension)
/**
 *  设置NavigationBar的私有属性backgroundView的背景颜色
 *
 */
- (void)hy_setBackgroundViewWithColor:(UIColor *)backgroundColor;


/**
 *  设置NavigationBar的背景透明度
 * */
- (void)hy_setBackgroundViewWithAlpha:(CGFloat)alpha;

/**
 *  重设NavigationBar的背景样式为默认的样式
 */
- (void)hy_resetBackgroundDefaultStyle;

@end
