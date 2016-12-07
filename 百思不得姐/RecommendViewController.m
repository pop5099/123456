//
//  RecommendViewController.m
//  百思不得姐
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "RecommendViewController.h"
#import "TitleTableViewCell.h"
#import "TitleModel.h"
#import "ContentModel.h"
#import "ContentTableViewCell.h"
@interface RecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *leftTableView;
@property (strong, nonatomic) IBOutlet UITableView *rightTableView;
@property (nonatomic ,strong)NSArray * titleArray;
//请求参数
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

//@property (nonatomic ,strong)NSArray * contentArray;
@end

@implementation RecommendViewController

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    //初始化控件
    [self setupTableView];
    
    //添加上啦刷新加载
    [self setupRefresh];
    
    //加载左边的数据
    [self loadLeftTableView];
    
  }
-(void)loadLeftTableView{
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    //设置超时
    
    
    //发送请求
    NSMutableDictionary * parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"category";
    parameters[@"c"]=@"subscribe";
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //隐藏指示器
        [SVProgressHUD dismiss];
        //返回的JSON数据
        self.titleArray = [TitleModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表
        [self.leftTableView reloadData];
        //默认选中第一行
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        //        [self.rightTableView reloadData];
        //  右边进入下啦刷新
        [self.rightTableView.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //显示失败信息会自动隐藏指示器
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        
    }];

}
//初始化
- (void)setupTableView
{
    self.title=@"推荐关注";
    self.view.backgroundColor=BACCOLOR;
    self.rightTableView.backgroundColor=BACCOLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.rightTableView.contentInset =  UIEdgeInsetsMake(64, 0, 0, 0);;
    self.rightTableView.rowHeight = 70;
    
    [self.leftTableView registerNib:[UINib nibWithNibName:@"TitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.rightTableView registerNib:[UINib nibWithNibName:@"ContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];

}
//添加刷新控件
-(void)setupRefresh{
    self.rightTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewContent)];
    self.rightTableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreontent)];
    self.rightTableView.mj_footer.hidden=YES;
}
-(void)loadNewContent{
    TitleModel * c1=self.titleArray[self.leftTableView.indexPathForSelectedRow.row];
    
    // 设置当前页码为1
    c1.currentPage = 1;
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(c1.id);
    params[@"page"] = @(c1.currentPage);
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:self.params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 字典数组 -> 模型数组
        NSArray *users = [ContentModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        // 清除所有旧数据
        [c1.userArray removeAllObjects];
        
        // 添加到当前类别对应的用户数组中
        [c1.userArray addObjectsFromArray:users];
        
        // 保存总数
        c1.total = [responseObject[@"total"] integerValue];
        
        // 不是最后一次请求
        if (self.params != params) return;
        
        // 刷新右边的表格
        [self.rightTableView reloadData];
        
        // 结束刷新
        [self.rightTableView.mj_header endRefreshing];
        
        // 让底部控件结束刷新
        [self checkFooterState];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        //结束刷新
        [self.rightTableView.mj_header endRefreshing];
    }];
}
- (void)checkFooterState
{
    TitleModel * c1=self.titleArray[self.leftTableView.indexPathForSelectedRow.row];
    // 每次刷新右边数据时, 都控制footer显示或者隐藏
    self.rightTableView.mj_footer.hidden = (c1.userArray.count == 0);
    
    // 让底部控件结束刷新
    if (c1.userArray.count == c1.total) { // 全部数据已经加载完毕
        [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
    } else { // 还没有加载完毕
        [self.rightTableView.mj_footer endRefreshing];
    }
}

-(void)loadMoreontent{
    TitleModel * c1=self.titleArray[self.leftTableView.indexPathForSelectedRow.row];
    
    // 设置当前页码为1
    c1.currentPage = 1;
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(c1.id);
    params[@"page"] = @(++c1.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:self.params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 字典数组 -> 模型数组
        NSArray *users = [ContentModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 添加到当前类别对应的用户数组中
        [c1.userArray addObjectsFromArray:users];
        
        // 不是最后一次请求
        if (self.params != params) return;
        
        // 刷新右边的表格
        [self.rightTableView reloadData];
        
        // 结束刷新
        [self.rightTableView.mj_header endRefreshing];
        
        // 让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        //结束刷新
        [self.rightTableView.mj_footer endRefreshing];
    }];

    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.leftTableView) {
        return self.titleArray.count;
    }else{
        // 监测footer的状态
        [self checkFooterState];

        TitleModel * c=self.titleArray[self.leftTableView.indexPathForSelectedRow.row];
        return c.userArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.rightTableView.mj_header endRefreshing];
    [self.rightTableView.mj_footer endRefreshing];
    
    if (tableView==self.leftTableView) {
        TitleTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.textLabel.textColor=[UIColor grayColor];
        cell.titleModel=self.titleArray[indexPath.row];
       
        return cell;
    }else{
         ContentTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
        TitleModel * c=self.titleArray[self.leftTableView.indexPathForSelectedRow.row];
        NSLog(@"%@",c);
        cell.contenModel=c.userArray[indexPath.row];
        return cell;
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 结束刷新
    [self.rightTableView.mj_header endRefreshing];
    [self.rightTableView.mj_footer endRefreshing];
    
 TitleModel * c =self.titleArray[indexPath.row];
    
    if (c.userArray.count) {
        [self.rightTableView reloadData];
    }else{
        //
        [self.rightTableView reloadData];
        
        // 进入下拉刷新状态
        [self.rightTableView.mj_header beginRefreshing];
}
    
    

   
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
//    });
//

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    // 停止所有操作
    [self.manager.operationQueue cancelAllOperations];
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
