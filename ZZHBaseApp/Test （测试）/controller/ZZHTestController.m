//
//  ZZHTestController.m
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import "ZZHTestController.h"
#import "ZZHTestModel.h"
@interface ZZHTestController ()

@end

@implementation ZZHTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSDictionary * params = @{
        @"action": @"user/login",
        @"params": @{
            @"username": @"admin",
            @"password": @"admin"
        }
    };

    
    [self loadDataWithUrl:BASE_API andParams:params andChangeModel:[ZZHTestModel class]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
