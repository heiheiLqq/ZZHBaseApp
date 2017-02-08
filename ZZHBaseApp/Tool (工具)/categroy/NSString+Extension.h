//
//  NSString+Extension.h
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString  *const XCColorKey = @"color";
static NSString  *const XCFontKey = @"font";
static NSString  *const XCRangeKey = @"range";
/**
 range的校验结果
 */
typedef enum
{
    RangeCorrect = 0,
    RangeError = 1,
    RangeOut = 2,
    
}RangeFormatType;
@interface NSString (Extension)

/**
 *  计算 MD5 值
 *
 *  @param input
 *
 *  @return
 */
- (NSString *)md5:(NSString *)input;

/**
 *  对 URL 进行编码
 *
 *  @return 编码后的 URL
 */
- (NSString *)urlEncode;


/**
 *  检测字符串是否为空（nil或者空字符串）
 *
 *  @param trim 是否忽略前后空白字符
 *
 *  @return 是否为空
 */

+(BOOL)isEmpty:(NSString *)str trim:(BOOL)trim;


/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param fontSize 字体的大小
 @result float 返回的高度
 */
+(float) heightForString:(NSString *)str fontSize:(float)fontSize andWidth:(float)width;

/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param fontSize 字体的大小
 @result float 返回的高度
 */
+ (float) widthForString:(NSString *)str fontSize:(float)fontSize andheight:(float)height;


/**
 *  字典转字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
/**
 *  空判断
 *
 *  @return 是否为空
 */
- (BOOL) isNullString;
#pragma mark - 校验字符串 是否是邮箱，电话等
/**
 *  匹配邮箱
 */
- (BOOL)isEmail:(NSString *)str;

/**
 *  匹配手机号码
 */
- (BOOL)isPhoneNumber:(NSString *)str;
/**
 *  匹配电话号码的类方法
 *
 *  @param mobile 电话号码
 *
 */
+ (BOOL) isValidateMobile:(NSString *)mobile;


/**
 *  匹配中国移动手机号码
 */
- (BOOL)isCMPhoneNumber:(NSString *)str;

/**
 *  匹配中国联通手机号码
 */
- (BOOL)isCUPhoneNumber:(NSString *)str;

/**
 *  匹配中国电信手机号码
 */
- (BOOL)isCTPhoneNumber:(NSString *)str;

/**
 *  匹配国内电话号码
 */
- (BOOL)isCallNumber:(NSString *)str;

/**
 *  匹配QQ号码
 */
- (BOOL)isQQ:(NSString *)str;

/**
 *  匹配网址URL的正则表达式
 */
- (BOOL)isURL:(NSString *)str;

/**
 *  匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)
 */
- (BOOL)isLegalCount:(NSString *)str;

/**
 *  匹配中国邮政编码
 */
- (BOOL)isPostcode:(NSString *)str;

/**
 *  匹配身份证
 */
- (BOOL)isIDCardNumber:(NSString *)str;

/**
 *  匹配ip地址
 */
-(BOOL)isIpAddress:(NSString *)str;
#pragma mark - 常用工具
/**
 *  获取当前设备deviceId
 *
 *  @return deviceId
 */
+ (NSString *) getDeviceIdentifierForVendor;
/**
 *  获取当前版本号
 *
 *  @return 版本号
 */
+ (NSString *) getAppVersions;

/**
 *  转换为周X
 *
 *  @param time 时间戳
 *
 *  @return 周几
 */
+ (NSString *) getWeekDay:(NSTimeInterval) time;
/**
 *  转换为XXXX年XX月XX日
 *
 *  @param time 时间戳
 *
 *  @return 年月日
 */
+ (NSString*) format:(NSTimeInterval) time;

/**
 *  转化为XX时XX分XX秒
 *
 *  @param time 时间戳
 *
 *  @return 时:分:秒
 */
+ (NSString*) formatTime:(NSTimeInterval) time;

/**
 *  转化为XXXX年XX月XX日XX时XX分XX秒
 *
 *  @param time 时间戳
 *
 *  @return 年月日 时:分:秒
 */
+ (NSString *) formatDateAndTime:(NSTimeInterval)time;

#pragma mark - 校验NSRange
/**
 *  校验范围（NSRange）
 *
 *  @param range Range
 *
 *  @return 校验结果：RangeFormatType
 */
- (RangeFormatType)checkRange:(NSRange)range;

#pragma mark - 改变单个范围字体的大小和颜色（富文本）
/**
 *  改变字体的颜色
 *
 *  @param color 颜色（UIColor）
 *  @param range 范围（NSRange）
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)changeColor:(UIColor *)color
                                  andRange:(NSRange)range;


/**
 *  改变字体大小
 *
 *  @param font  字体大小(UIFont)
 *  @param range 范围(NSRange)
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)changeFont:(UIFont *)font
                                 andRange:(NSRange)range;


/**
 *   改变字体的颜色和大小
 *
 *  @param color      字符串的颜色
 *  @param colorRange 需要改变颜色的字符串范围
 *  @param font       字体大小
 *  @param fontRange  需要改变字体大小的字符串范围
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */

- (NSMutableAttributedString *)changeColor:(UIColor *)color
                              andColorRang:(NSRange)colorRange
                                   andFont:(UIFont *)font
                              andFontRange:(NSRange)fontRange;

#pragma mark - 改变多个范围内的字体和颜色

/**
 *  改变多段字符串为一种颜色
 *
 *  @param color  字符串的颜色
 *  @param ranges 范围数组:[NSValue valueWithRange:NSRange]
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)changeColor:(UIColor *)color andRanges:(NSArray<NSValue *> *)ranges;

/**
 *  改变多段字符串为同一大小
 *
 *  @param font   字体大小
 *  @param ranges 范围数组:[NSValue valueWithRange:NSRange]
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)changeFont:(UIFont *)font andRanges:(NSArray<NSValue *> *)ranges;
/**
 *  用于多个位置颜色和大小改变
 *
 *  @param changes 对应属性改变的数组.示例:@[@{XCColorKey:UIColor,XCFontKey:UIFont,XCRangeKey:NSArray<NSValue *>}];
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)changeColorAndFont:(NSArray<NSDictionary *> *)changes;


#pragma mark - 对特定字符进行改变
/**
 *  对相应的字符串进行改变
 *
 *  @param str   需要改变的字符串
 *  @param color 字体颜色
 *  @param font  字体大小
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)changeWithStr:(NSString *)str andColor:(UIColor *)color andFont:(UIFont *)font;

#pragma mark - 给字符串添加中划线
/**
 *  添加中划线
 *
 *  @return 富文本
 */
- (NSMutableAttributedString *)addCenterLine;

#pragma mark - 给字符串添加下划线
/**
 *  添加下划线
 *
 *  @return 富文本
 */
- (NSMutableAttributedString *)addDownLine;
@end
