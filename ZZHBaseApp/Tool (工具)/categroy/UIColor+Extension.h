//
//  UIColor+Extension.h
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/8.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/** 默认alpha为1 */
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/** 从十六进制字符串获取颜色,默认alpha为1 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/** 从十六进制字符串获取颜色，alpha需要自己传递 color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
