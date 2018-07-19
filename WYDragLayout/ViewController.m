//
//  ViewController.m
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/17.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIButton *detailButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.detailButton];
}

- (void)detailButtonClick
{
    DetailViewController *controller = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- lazy ---
- (UIButton *)detailButton
{
    if (!_detailButton) {
        _detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _detailButton.frame = CGRectMake(0, (KScreenHeight - 20)/2.0, kScreenWidth, 20);
        [_detailButton setTitle:@"商品详情页" forState:UIControlStateNormal];
        _detailButton.titleLabel.font = kFontBold(20 );
        [_detailButton setTitleColor:kRGB(50, 50, 50) forState:UIControlStateNormal];
        [_detailButton addTarget:self action:@selector(detailButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailButton;
}

@end
