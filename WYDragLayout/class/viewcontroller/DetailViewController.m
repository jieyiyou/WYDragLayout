//
//  DetailViewController.m
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/17.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "DetailViewController.h"
#import "BaseClassNameModel.h"
#import "BaseTableViewCell.h"
#import "ImageTableViewCell.h"
#import "InfoTableViewCell.h"
#import "DragTableViewCell.h"
#import "WebViewScrollView.h"

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate,WebViewScrollViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *classnameDataSources;

@property (nonatomic,strong)WebViewScrollView *webView;

@property (nonatomic,assign)CGFloat webViewHeight;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"商品详情";
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.webView];
    
    [self setClassWithCell];
}

- (void)setClassWithCell
{
    
    [self.classnameDataSources removeAllObjects];
    /*
     设置不同格式的cell
     */
    BaseClassNameModel *imageModel= [[BaseClassNameModel alloc] init];
    imageModel.className = @"ImageTableViewCell";
    imageModel.cellHeight = 350.f ;
    [self.classnameDataSources addObject:imageModel];
    
    BaseClassNameModel *infoModel= [[BaseClassNameModel alloc] init];
    infoModel.className = @"InfoTableViewCell";
    infoModel.cellHeight = 200.f ;
    [self.classnameDataSources addObject:infoModel];
    
    BaseClassNameModel *gapmodel = [[BaseClassNameModel alloc] init];
    gapmodel.cellHeight = 10.f;
    gapmodel.className = @"GrayGapTableViewCell";
    [self.classnameDataSources addObject:gapmodel];
    
    BaseClassNameModel *pullModel= [[BaseClassNameModel alloc] init];
    pullModel.className = @"DragTableViewCell";
    pullModel.cellHeight = 50.f ;
    [self.classnameDataSources addObject:pullModel];

}

// 进入详情的动画
- (void)goToDetailAnimation
{
    self.navigationItem.title = @"图文详情";
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.webView.frame = CGRectMake(0, 0, kScreenWidth, KScreenHeight);
        self.tableView.frame = CGRectMake(0, -self.view.bounds.size.height, kScreenWidth, self.webViewHeight);
    } completion:^(BOOL finished) {
        
    }];
}

// 返回第一个界面的动画
- (void)backToFirstPageAnimation
{
    self.navigationItem.title = @"商品详情";
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.tableView.frame = CGRectMake(0, 0, kScreenWidth, KScreenHeight);
        self.webView.frame = CGRectMake(0,KScreenHeight, kScreenWidth, self.webViewHeight);
    } completion:^(BOOL finished) {
    
    }];
}

#pragma mark --- ProductDetailViewDelegate ---
- (void)pullDragAndShowProduct
{
    [self backToFirstPageAnimation];
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.classnameDataSources.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseClassNameModel* model = [self.classnameDataSources objectAtIndex:indexPath.row];
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseClassNameModel* model = self.classnameDataSources[indexPath.row] ;
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.className];
    if (!cell) {
        cell = [[[NSClassFromString(model.className) class] alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:model.className];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark ---- scrollView delegate

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if([scrollView isKindOfClass:[UITableView class]]) // tableView界面上的滚动
    {
        // 能触发翻页的理想值:tableView整体的高度减去屏幕本省的高度
        CGFloat valueNum = self.tableView.contentSize.height - KScreenHeight + KNavgationHight ;
        if ((offsetY - valueNum) > 100)
        {
            [self goToDetailAnimation]; // 进入图文详情的动画
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark --- lazy ---
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, KScreenHeight)];
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (NSMutableArray *)classnameDataSources
{
    if (!_classnameDataSources) {
        _classnameDataSources = [[NSMutableArray alloc] init];
    }
    return _classnameDataSources;
}

- (WebViewScrollView *)webView
{
    if (!_webView) {
        _webView = [[WebViewScrollView alloc] initWithFrame:CGRectMake(0, KScreenHeight, kScreenWidth, KScreenHeight)];
        _webView.backgroundColor = kRGB(255, 255, 255);
        _webView.webViewDelegate = self;
        [_webView setSelfDataWithObj:@"https://m.nongmuren.com/interface/goodsDetail/goDetails.action?&goodsId=19&share=3"];
    }
    return _webView;
}

@end
