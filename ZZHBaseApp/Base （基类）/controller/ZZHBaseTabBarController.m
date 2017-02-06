//
//  ZZHBaseTabBarController.m
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import "ZZHBaseTabBarController.h"
#import "ZZHBaseNavigationController.h"
#import "ZZHBaseTableViewController.h"
#import "ZZHomeController.h"
#import "ZZHUserCenterController.h"
#import "ZZHTestController.h"
@interface ZZHBaseTabBarController ()

@end

@implementation ZZHBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTabbarItem];
    
//    [self setValue:[[MyTabbar alloc] init] forKeyPath:@"tabBar"];
    
    
    
}
+(void)initialize{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
- (void)addTabbarItem{
    
    
    [self addItemTitle:@"首页" andImage:@"tabBar_essence_icon" andSelectedImage:@"tabBar_essence_click_icon" andChildVc:[[ZZHomeController alloc]init]];
    [self addItemTitle:@"基类测试" andImage:@"tabBar_new_icon" andSelectedImage:@"tabBar_new_click_icon" andChildVc:[[ZZHTestController alloc]init]];
    [self addItemTitle:@"个人中心" andImage:@"tabBar_new_icon" andSelectedImage:@"tabBar_new_click_icon" andChildVc:[[ZZHUserCenterController alloc]init]];
   
}



- (void)addItemTitle:(NSString *)title andImage:(NSString *)image andSelectedImage:(NSString *)selectedImage andChildVc:(UIViewController *)vc{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    ZZHBaseNavigationController * naVc = [[ZZHBaseNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:naVc];
}

@end
