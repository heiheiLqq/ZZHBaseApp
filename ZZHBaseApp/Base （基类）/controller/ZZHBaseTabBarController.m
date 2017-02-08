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
    //自定义tabbar
//    [self setValue:[[MyTabbar alloc] init] forKeyPath:@"tabBar"];
    
    
    
}
#pragma mark - 设置tabbar item
+(void)initialize{
    //非选中状态
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    //非选中字体大小
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    //非选中字体颜色
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //选中状态
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    //选中状态下字体大小
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    //选中状态下字体颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    //获得item
    UITabBarItem *item = [UITabBarItem appearance];
    //设置item normal状态
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    //设置item selected状态
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
#pragma mark - 添加TabbarItem
- (void)addTabbarItem{
    
    
    [self addItemTitle:@"首页" andImage:@"tabBar_essence_icon" andSelectedImage:@"tabBar_essence_click_icon" andChildVc:[[ZZHomeController alloc]init]];
    [self addItemTitle:@"基类测试" andImage:@"tabBar_new_icon" andSelectedImage:@"tabBar_new_click_icon" andChildVc:[[ZZHTestController alloc]init]];
    [self addItemTitle:@"个人中心" andImage:@"tabBar_new_icon" andSelectedImage:@"tabBar_new_click_icon" andChildVc:[[ZZHUserCenterController alloc]init]];
   
}


#pragma mark- 添加子导航控制器
- (void)addItemTitle:(NSString *)title andImage:(NSString *)image andSelectedImage:(NSString *)selectedImage andChildVc:(UIViewController *)vc{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    ZZHBaseNavigationController * naVc = [[ZZHBaseNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:naVc];
}

@end
