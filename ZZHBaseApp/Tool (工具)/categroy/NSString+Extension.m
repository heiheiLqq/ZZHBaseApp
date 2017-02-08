//
//  NSString+Extension.m
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)
/**
 *  匹配邮箱
 */
- (BOOL)isEmail:(NSString *)str {
    NSString * regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配手机号码
 */
- (BOOL)isPhoneNumber:(NSString *)str {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * regex = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    return [self checkStringWithRegex:regex checkString:str];
}

+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}


/**
 *  匹配中国移动手机号码
 */
- (BOOL)isCMPhoneNumber:(NSString *)str {
    NSString * regex = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配中国联通手机号码
 */
- (BOOL)isCUPhoneNumber:(NSString *)str {
    NSString * regex = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配中国电信手机号码
 */
- (BOOL)isCTPhoneNumber:(NSString *)str {
    NSString * regex = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配国内电话号码
 */
- (BOOL)isCallNumber:(NSString *)str {
    NSString * regex = @"d{3}-d{8}|d{4}-d{7}";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配QQ号码
 */
- (BOOL)isQQ:(NSString *)str {
    NSString * regex = @"[1-9][0-9]{4,}";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配网址URL
 */
- (BOOL)isURL:(NSString *)str {
    NSString * regex = @"[a-zA-z]+://[^s]*";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)
 */
- (BOOL)isLegalCount:(NSString *)str {
    NSString * regex = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配中国邮政编码
 */
- (BOOL)isPostcode:(NSString *)str {
    NSString * regex = @"[1-9]d{5}(?!d)";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配身份证
 */
- (BOOL)isIDCardNumber:(NSString *)str {
    NSString * regex = @"d{15}|d{18}";
    return [self checkStringWithRegex:regex checkString:str];
}

/**
 *  匹配ip地址
 */
-(BOOL)isIpAddress:(NSString *)str {
    NSString * regex = @"d+.d+.d+.d+";
    return [self checkStringWithRegex:regex checkString:str];
}

#pragma mark - private

- (BOOL)checkStringWithRegex:(NSString *)regex checkString:(NSString *)checkString {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:checkString];
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    return  output;
}

/**
 *
 *
 *  @param trim 是否要删除字符串中的空格
 *
 */
+ (BOOL)isEmpty:(NSString *)str trim:(BOOL)trim{
    if(str == nil || str.length == 0){
        return YES;
    }else{
        if(trim){
            return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0;
        }
    }
    return NO;
}

- (NSString *)urlEncode {
    return [[self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}





+ (float) heightForString:(NSString *)str fontSize:(float)fontSize andWidth:(float)width
{
    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:Nil];
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    
    return ceilf(rect.size.height);
}



+ (float) widthForString:(NSString *)str fontSize:(float)fontSize andheight:(float)height
{
    CGRect rect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:Nil];
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return ceilf(rect.size.width);
}




/**
 *  字典转字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];

    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
- (BOOL) isNullString{
    if(self == nil) {
        return YES;
    }
    
    if((NSNull *)self == [NSNull null]) {
        return YES;
    }
    
    if(self.length == 0) {
        return YES;
    }
    
    if([self isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}
+ (NSString *) getDeviceIdentifierForVendor{
    return  [[UIDevice currentDevice].identifierForVendor UUIDString];
}

+ (NSString *)getAppVersions{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+ (NSString *)getWeekDay:(NSTimeInterval)time {
    //创建一个星期数组
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    //将时间戳转换成日期
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:newDate];
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

+ (NSString*) format:(NSTimeInterval) time;
{
    if (time < 0)
    {
        return @"";
    }
    
    NSDateFormatter *formatter;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time/1000];
    return [formatter stringFromDate:date];
}

+ (NSString*) formatTime:(NSTimeInterval) time;
{
    if (time < 0)
    {
        return @"";
    }
    
    NSDateFormatter *formatter;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time/1000];
    return [formatter stringFromDate:date];
}

+ (NSString *) formatDateAndTime:(NSTimeInterval)time;{
    if (time < 0) {
        return @"";
    }
    NSDateFormatter *formatter;
    formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time/1000];
    return [formatter stringFromDate:date];
}

- (RangeFormatType)checkRange:(NSRange)range{
    NSInteger loc = range.location;
    NSInteger len = range.length;
    if (loc>=0 && len>0) {
        if (range.location + range.length <= self.length) {
            return RangeCorrect;
        }
        else{
            NSLog(@"The range out-of-bounds!");
            return RangeOut;
        }
    }
    else{
        NSLog(@"The range format is wrong: NSMakeRange(a,b) (a>=0,b>0). ");
        return RangeError;
    }
}

- (NSMutableAttributedString *)changeColor:(UIColor *)color
                                  andRange:(NSRange)range{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    if ([self checkRange:range] == RangeCorrect) {
        if (color) {
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        else{
            NSLog(@"color is nil");
        }
        
    }
    return attributedStr;
}


- (NSMutableAttributedString *)changeFont:(UIFont *)font
                                 andRange:(NSRange)range{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    if ([self checkRange:range] == RangeCorrect) {
        if (font) {
            [attributedStr addAttribute:NSFontAttributeName value:font range:range];
        }
        else{
            NSLog(@"font is nil...");
        }
    }
    return attributedStr;
}


- (NSMutableAttributedString *)changeColor:(UIColor *)color
                              andColorRang:(NSRange)colorRange
                                   andFont:(UIFont *)font
                              andFontRange:(NSRange)fontRange{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    if ([self checkRange:colorRange] == RangeCorrect) {
        if (color) {
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:colorRange];
        }
        else{
            NSLog(@"color is nil");
        }
    }
    if ([self checkRange:fontRange] == RangeCorrect) {
        if (font) {
            [attributedStr addAttribute:NSFontAttributeName value:font range:fontRange];
        }
        else{
            NSLog(@"font is nil...");
        }
    }
    return attributedStr;
}

- (NSMutableAttributedString *)changeColor:(UIColor *)color andRanges:(NSArray<NSValue *> *)ranges{
    __block NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    if (color) {
        [ranges enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [(NSValue *)obj rangeValue];
            if ([self checkRange:range] == RangeCorrect) {
                [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
            }
            else{
                NSLog(@"index:%ld",idx);
            }
            
        }];
    }
    else{
        NSLog(@"color is nil...");
    }
    return attributedStr;
}

- (NSMutableAttributedString *)changeFont:(UIFont *)font andRanges:(NSArray<NSValue *> *)ranges{
    __block NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    if (font) {
        [ranges enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [(NSValue *)obj rangeValue];
            if ([self checkRange:range] == RangeCorrect) {
                [attributedStr addAttribute:NSFontAttributeName value:font range:range];
            }
            else{
                NSLog(@"index:%ld",idx);
            }
            
        }];
    }
    else{
        NSLog(@"font is nil...");
    }
    return attributedStr;
}

- (NSMutableAttributedString *)changeColorAndFont:(NSArray<NSDictionary *> *)changes{
    __block NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    [changes enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIColor *color = obj[XCColorKey];
        UIFont *font = obj[XCFontKey];
        NSArray<NSValue *> *ranges = obj[XCRangeKey];
        if (!color) {
            NSLog(@"warning: NSColorKey -> nil! index:%ld",idx);
        }
        if (!font) {
            NSLog(@"warning: NSFontKey -> nil! index:%ld",idx);
        }
        if (ranges.count>0) {
            [ranges enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSRange range = [obj rangeValue];
                if ([self checkRange:range] == RangeCorrect) {
                    if (color) {
                        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
                    }
                    if (font) {
                        [attributedStr addAttribute:NSFontAttributeName value:font range:range];
                    }
                }
                else{
                    NSLog(@"index:%ld",idx);
                }
                
            }];
        }
        else{
            NSLog(@"warning: NSRangeKey -> nil! index:%ld",idx);
        }
    }];
    return attributedStr;
    
}

- (NSMutableAttributedString *)changeWithStr:(NSString *)str andColor:(UIColor *)color andFont:(UIFont *)font{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    NSUInteger length = self.length;
    while (length > str.length) {
        NSRange range = [self rangeOfString:str options:NSBackwardsSearch range:NSMakeRange(0, length)];
        if ([self checkRange:range] == RangeCorrect) {
            if (color) {
                [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
            }
            if (font) {
                [attributedStr addAttribute:NSFontAttributeName value:font range:range];
            }
            length = range.location;
        }
        else{
            length = str.length - 1;
        }
    }
    return attributedStr;
}
- (NSMutableAttributedString *)addCenterLine{
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:self attributes:attribtDic];
    return attributeStr;
}
- (NSMutableAttributedString *)addDownLine{
    
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:self attributes:attribtDic];
    return attributeStr;
}
@end
