//
//  ZZHBaseTableViewController.h
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZHBaseTableViewController : UITableViewController


//数据源
@property (nonatomic,copy)NSMutableArray * dataSource;

- (void)loadDataWithUrl:(NSString *)url andParams:(NSDictionary *)params andChangeModel:(Class)model;


//是否应该添加MJRefresh控件
-(void)shouldInitMJRefreshHeader:(BOOL)should;
-(void)shouldInitMJRefreshFooter:(BOOL)should;
-(void)stopHeaderRefresh;

-(void)stopFooterRefreshWithNoData;

-(void)stopFooterRefresh;
@end
