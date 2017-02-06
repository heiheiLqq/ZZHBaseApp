//
//  NSString+Extension.h
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  字典转字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
@end
