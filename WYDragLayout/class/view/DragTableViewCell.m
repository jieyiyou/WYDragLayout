
//
//  DragTableViewCell.m
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/17.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "DragTableViewCell.h"

@implementation DragTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

#pragma mark private
- (void)setupSubViews
{
    [self addSubview:self.pullUpBtn];
}

- (void)pullUpBtnDidClicked
{
    if (self.block) {
        self.block();
    }
}

#pragma mark --- lazy ---
- (UIButton *)pullUpBtn
{
    if (!_pullUpBtn) {
        _pullUpBtn = [[UIButton alloc]init];
        _pullUpBtn.frame = CGRectMake(0, 0, kScreenWidth, 50);
        [_pullUpBtn setImage:kImageName(@"btn_zhedie") forState:UIControlStateNormal];
        [_pullUpBtn setTitle:@"上拉查看图文详情" forState:UIControlStateNormal];
        [_pullUpBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _pullUpBtn.titleLabel.font = kFont(12);
        _pullUpBtn.layer.borderWidth = 1;
        _pullUpBtn.layer.borderColor = kRGB(234,235,240).CGColor;
        [_pullUpBtn addTarget:self action:@selector(pullUpBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pullUpBtn;
}


@end
