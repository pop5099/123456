//
//  EssenceViewController.m
//  百思不得姐
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 pop. All rights reserved.
//

#import "EssenceViewController.h"
#import "RecomTextTableViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "SameTableViewController.h"
@interface EssenceViewController ()<UIScrollViewDelegate>
//当前选中的按钮
@property (nonatomic ,strong)UIButton * selectedButton;
//标签栏底部红条
@property (nonatomic ,strong)UIView * indicatorView;
//顶部所有的标签
@property (nonatomic ,strong)UIView * titlesView;
//控制器

//底部的所有内容
@property (nonatomic, weak) UIScrollView *contentView;

// 标题数组
@property (nonatomic, strong) NSArray * titlesArray;
// 控制器对应的字典
@property (nonatomic, strong) NSMutableDictionary * controllersDict;
//控制器缓存池
@property (nonatomic, strong)NSMutableDictionary * controllerCache;
@end

@implementation EssenceViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=BACCOLOR;
    // 设置导航栏
    [self setupNav];
    
    // 初始化子控制器
    [self setupChildVces];
    
    // 设置顶部的标签栏
    [self setupTitlesView];
    
    // 创建底部scrollView
    [self setupContentView];
}
// 初始化子控制器

- (void)setupChildVces{

    SameTableViewController *recommend = [[SameTableViewController alloc] init];
    recommend.title=@"c猜你妹";
    recommend.type=SameTypeRecommend;
    [self addChildViewController:recommend];
    
    SameTableViewController *video = [[SameTableViewController alloc] init];
    video.title=@"看你妹";
    video.type=SameTypeVideo;
    [self addChildViewController:video];
    
    SameTableViewController *voice = [[SameTableViewController alloc] init];
    voice.title=@"声音";
    voice.type=SameTypeVoice;
    [self addChildViewController:voice];
    
    SameTableViewController *picture = [[SameTableViewController alloc] init];
    picture.title=@"图片";
    picture.type=SameTypePicture;
    [self addChildViewController:picture];
    
    SameTableViewController *cross = [[SameTableViewController alloc] init];
    cross.title=@"段子";
    cross.type=SameTypeCross;
    [self addChildViewController:cross];
    
    SameTableViewController *hot= [[SameTableViewController alloc] init];
    hot.title=@"网红";
    [self addChildViewController:hot];
    
    SameTableViewController *ranking = [[SameTableViewController alloc] init];
    ranking.title=@"排行";
    [self addChildViewController:ranking];

    SameTableViewController *bell = [[SameTableViewController alloc] init];
    bell.title=@"美女";
    [self addChildViewController:bell];
    
    SameTableViewController *knowled = [[SameTableViewController alloc] init];
    knowled.title=@"知识";
    [self addChildViewController:knowled];
    
    SameTableViewController *game= [[SameTableViewController alloc] init];
    game.title=@"游戏";
    [self addChildViewController:game];
}

// 设置顶部的标签栏
 
- (void)setupTitlesView {
    // 标签栏整体
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithRed:228/255.0 green:46/255.0 blue:22/255.0 alpha:1];
    titlesView.width = self.view.width;
    titlesView.height = 35;
    titlesView.Y = 64;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor whiteColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.Y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    // 内部的子标签
//    NSArray *titles = @[@"全部", @"视频", @"图片", @"段子", @"网红", @"排行", @"社会", @"美女", @"知识", @"游戏"];
    CGFloat width = titlesView.width / self.childViewControllers.count;
    CGFloat height = titlesView.height;
    for (NSInteger i = 0; i<self.childViewControllers.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.X = i * width;
        UIViewController * vc=self.childViewControllers[i];
        [button setTitle:vc.title forState:UIControlStateNormal];
        //        [button layoutIfNeeded]; // 强制布局(强制更新子控件的frame)
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        
        // 默认点击了第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    
    [titlesView addSubview:indicatorView];

}
// 按钮点击

- (void)titleClick:(UIButton *)button {
    // 修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

//底部的scrollView
- (void)setupContentView{
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}
//设置导航栏
 
- (void)setupNav {
    // 设置导航栏标题

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" highImageName:@"MainTagSubIconClick" target:self action:@selector(tagClick)];

    // 设置背景色
    self.view.backgroundColor =BACCOLOR;
}


//  标签点击

- (void)tagClick
{
    RecomTextTableViewController * vc=[[RecomTextTableViewController alloc]init];
    vc.view.backgroundColor=BACCOLOR;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UIScrollViewDelegate
// scrollView结束了滚动动画以后就会调用这个方法（比如- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;方法执行的动画完毕后）
 
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 取出子控制器
    UITableViewController *vc = self.childViewControllers[index];
    vc.view.X = scrollView.contentOffset.x;
    vc.view.Y = 0; // 设置控制器view的y值为0(默认是20)
    vc.view.height = scrollView.height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    // 设置内边距
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = CGRectGetMaxY(self.titlesView.frame);
    vc.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    // 设置滚动条的内边距
    vc.tableView.scrollIndicatorInsets = vc.tableView.contentInset;
    [scrollView addSubview:vc.view];

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
