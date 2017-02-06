//
//  LoginController.m
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import "ZZHLoginController.h"
#import "ZZHRegisterController.h"
@interface ZZHLoginController ()

@end

@implementation ZZHLoginController
- (IBAction)login:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)goRegister:(id)sender {
    
    
    [self.navigationController pushViewController:[[ZZHRegisterController alloc] init] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
