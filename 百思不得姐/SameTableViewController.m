//
//  SameTableViewController.m
//  百思不得姐
//
//  Created by pop5099 on 16/10/9.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "SameTableViewController.h"
#import "CrossModel.h"
#import "EssenceTableViewCell.h"
#import "UILabel+AutoSize.h"
@interface SameTableViewController ()
@property (nonatomic,strong)NSMutableArray * crossArray;
//当前页码
@property(nonatomic,assign)NSInteger page;
//加载下一页需要的数据
@property(nonatomic,strong)NSString * maxtime;

@property(nonatomic,strong)NSMutableDictionary * parameters;
@end

@implementation SameTableViewController

-(NSMutableArray *)crossArray{
    if (!_crossArray) {
        self.crossArray=[NSMutableArray array];
    }
    return _crossArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=BACCOLOR;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //    self.tableView.autoresizesSubviews=YES
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"EssenceTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //刷新
    [self setUpRefresh];
    
}
-(void)setUpRefresh{
    
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewCross)];
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    //进来就刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreCross)];
    //    self.tableView.mj_footer.hidden=YES;
}
//加载数据
-(void)loadNewCross{
    // 结束上啦
    [self.tableView.mj_footer endRefreshing];
    
    //发送请求
    NSMutableDictionary * parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"list";
    parameters[@"c"]=@"data";
    parameters[@"type"]=@(self.type);
    self.parameters=parameters;
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.parameters != parameters){
            return;
        }
        //NSLog(@"%@",responseObject);
        
        //存储maxtime
        self.maxtime=responseObject[@"info"][@"maxtime"];
        
        //返回的JSON数据
        self.crossArray=[CrossModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表
        [self.tableView reloadData];
        //结束刷新
        [self.tableView.mj_header endRefreshing];
        //清空页码
        self.page=0;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.parameters != parameters){
            return;
        }
        //显示失败信息会自动隐藏指示器
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        //结束刷新
        [self.tableView.mj_header endRefreshing];
        
    }];
}

-(void)loadMoreCross{
    
    self.page++;
    //发送请求
    NSMutableDictionary * parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"list";
    parameters[@"c"]=@"data";
    parameters[@"type"]=@(self.type);
    NSInteger page = self.page + 1;
    parameters[@"page"]=@(page);
    parameters[@"maxtime"]=self.maxtime;
    
    self.parameters=parameters;
    
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.parameters != parameters){
            return;
        }
        
        //存储maxtime
        self.maxtime=responseObject[@"info"][@"maxtime"];
        
        //返回的JSON数据
        NSMutableArray * array=[CrossModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.crossArray addObjectsFromArray:array];
        
        //刷新表
        [self.tableView reloadData];
        
        //结束刷新
        [self.tableView.mj_footer endRefreshing];
        // 设置页码
        self.page = page;
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.parameters != parameters){
            return;
        }
        //显示失败信息会自动隐藏指示器
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        //结束刷新
        [self.tableView.mj_footer endRefreshing];
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.crossArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EssenceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model=self.crossArray[indexPath.row];
    //无色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CrossModel * model=self.crossArray[indexPath.row];
    //返回模型对应的cell高度
    return model.cellHeight;
}


@end
