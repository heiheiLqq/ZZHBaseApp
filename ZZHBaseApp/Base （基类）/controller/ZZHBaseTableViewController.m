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

    self.url = url;
    self.params = params;
    self.model = model;
    self.pageNo = 1;
    self.pageSize = 10;
    

    [self shouldInitMJRefreshHeader:YES];
    
    [self shouldInitMJRefreshFooter:YES];
    
    [self.tableView.mj_header beginRefreshing];

}

#pragma mark -刷新控件
-(void)shouldInitMJRefreshHeader:(BOOL)should{
    if (should) {
        MJRefreshNormalHeader *head = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        self.tableView.mj_header = head;
        
    }
    
}
-(void)shouldInitMJRefreshFooter:(BOOL)should{
    if (should) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    
}
//加载新数据
-(void)loadNewData{
    
    self.pageNo = 1;
    
    
    NSLog(@"%@,%@,%@,%ld,%ld",self.url,self.params,self.model,self.pageNo,self.pageSize);

    [ZZHAFNTool POST:self.url params:self.params success:^(NSURLSessionDataTask *task, id responseObject) {
            
            
        NSLog(@"success:%@",responseObject);
        
//        NSArray *list = [self.model mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];

        
        [self stopHeaderRefresh];

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
            
    }];

    
}
//加载更多数据
-(void)loadMoreData{
    
    self.pageNo++;
    
    NSLog(@"%@,%@,%@,%ld,%ld",self.url,self.params,self.model,self.pageNo,self.pageSize);
    
    [ZZHAFNTool POST:self.url params:self.params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSLog(@"success:%@",responseObject);
        
        [self stopHeaderRefresh];
        
        
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
//停止头部刷新
-(void)stopHeaderRefresh{
    [self.tableView.mj_header endRefreshing];
}
//停止底部刷新,无更多数据
-(void)stopFooterRefreshWithNoData{
    
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}
//停止底部刷新
-(void)stopFooterRefresh{
    
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
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
