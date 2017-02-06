//
//  ZZHomeController.m
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import "ZZHomeController.h"

@interface ZZHomeController ()

@end

@implementation ZZHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self shouldInitMJRefreshHeader:YES];
    
    [self shouldInitMJRefreshFooter:YES];

}

-(void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self stopHeaderRefresh];
    });
}
-(void)loadMoreData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self stopFooterRefresh];
    });
}


@end
