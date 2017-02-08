//
//  ZZHBaseTableViewController.h
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZHBaseTableViewController : UITableViewController


/***
 ** 数据源
 */
@property (nonatomic,copy)NSMutableArray * dataSource;
/***
 ** 添加刷新方法
 */
- (void)loadDataWithUrl:(NSString *)url andParams:(NSDictionary *)params andChangeModel:(Class)model;


/***
 ** 是否添加刷新控件
 */
-(void)shouldInitMJRefreshHeader:(BOOL)should;
-(void)shouldInitMJRefreshFooter:(BOOL)should;
/***
 ** 停止头部刷新方法
 */
-(void)stopHeaderRefresh;
/***
 ** 停止底部刷新方法且没有数据时
 */
-(void)stopFooterRefreshWithNoData;
/***
 ** 停止底部刷新方法
 */
-(void)stopFooterRefresh;
@end
