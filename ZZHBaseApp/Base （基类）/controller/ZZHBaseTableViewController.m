//
//  ZZHBaseTableViewController.m
//  ZZHBaseApp
//
//  Created by zzh on 2017/2/6.
//  Copyright © 2017年 zzh. All rights reserved.
//

#import "ZZHBaseTableViewController.h"

@interface ZZHBaseTableViewController ()
//模型
@property (nonatomic ,strong)Class model;
//请求网址
@property (nonatomic,copy)NSString * url;
//参数
@property (nonatomic,copy)NSDictionary * params;
//页码
@property (nonatomic,assign)NSInteger pageNo;
//每页显示数量
@property (nonatomic,assign)NSInteger pageSize;
@end

@implementation ZZHBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (void)loadDataWithUrl:(NSString *)url andParams:(NSDictionary *)params andChangeModel:(Class)model{

    //设置请求地址
    self.url = url;
    //设置参数
    self.params = params;
    //需要转换的模型
    self.model = model;
    //页码
    self.pageNo = 1;
    //每页数量
    self.pageSize = 10;
    //添加头部刷新控件
    [self shouldInitMJRefreshHeader:YES];
    //添加尾部刷新控件
    [self shouldInitMJRefreshFooter:YES];
    //头部凯斯刷新
    [self.tableView.mj_header beginRefreshing];

}

#pragma mark -数据源懒加载
-(NSMutableArray *)dataSource{

    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
    }

    return _dataSource;
}

#pragma mark -刷新控件
//是否开启下拉刷新
-(void)shouldInitMJRefreshHeader:(BOOL)should{
    if (should) {
        MJRefreshNormalHeader *head = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        self.tableView.mj_header = head;
        
    }
    
}
//是否开启上滑加载
-(void)shouldInitMJRefreshFooter:(BOOL)should{
    if (should) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    
}
#pragma mark -下拉刷新
//加载新数据
-(void)loadNewData{
    //page重置
    self.pageNo = 1;
//    NSLog(@"%@,%@,%@,%ld,%ld",self.url,self.params,self.model,self.pageNo,self.pageSize);
    //请求第一页数据
    [ZZHAFNTool POST:self.url params:self.params success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"success:%@",responseObject);
        //先清空数据源
        [self.dataSource removeAllObjects];
        //把请求的数据转换成模型数组
        NSArray *arr = [self.model mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        //把请求下来的数据加到数据源中
        [self.dataSource addObjectsFromArray:arr];
        //刷新tableview
        [self.tableView reloadData];
        //停止头部刷新
        [self stopHeaderRefresh];

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        //停止头部刷新
        [self stopHeaderRefresh];
    }];

    
}
#pragma mark -上滑加载
//加载更多数据
-(void)loadMoreData{
    //页码加一
    self.pageNo++;
//    NSLog(@"%@,%@,%@,%ld,%ld",self.url,self.params,self.model,self.pageNo,self.pageSize);
    //请求下一页数据
    [ZZHAFNTool POST:self.url params:self.params success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"success:%@",responseObject);
        //将请求下来的数据转换成模型数组
        NSArray *arr = [self.model mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        //将数组添加到数据源中
        [self.dataSource addObjectsFromArray:arr];
        //刷新tableview
        [self.tableView reloadData];
        //结束尾部刷新
        [self stopFooterRefresh];
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        //结束尾部刷新
        [self stopFooterRefresh];
    }];
}
#pragma mark -停止头部刷新
-(void)stopHeaderRefresh{
    [self.tableView.mj_header endRefreshing];
}
#pragma mark -停止底部刷新,无更多数据
-(void)stopFooterRefreshWithNoData{
    
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}
#pragma mark -停止底部刷新
-(void)stopFooterRefresh{
    
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 20;

}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
