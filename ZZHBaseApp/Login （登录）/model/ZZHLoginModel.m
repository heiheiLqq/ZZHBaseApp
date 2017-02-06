//
//  LoginModel.m
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import "ZZHLoginModel.h"
#import "ZZHLoginController.h"
#import "ZZHBaseNavigationController.h"
@implementation ZZHLoginModel
+ (void)login{

    ZZHLoginController * login = [[ZZHLoginController alloc]init];
    
    login.title = @"登录";
    
    ZZHBaseNavigationController * loginNav = [[ZZHBaseNavigationController alloc]initWithRootViewController:login];
    
    UIApplication *app =[UIApplication sharedApplication];
    
    [app.keyWindow.rootViewController presentViewController:loginNav animated:YES completion:^{
        
    }];

}


@end
