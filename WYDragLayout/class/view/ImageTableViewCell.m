
//
//  ImageTableViewCell.m
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/17.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "ImageTableViewCell.h"

@interface ImageTableViewCell()

@property (nonatomic,strong)UIImageView *iconImageView;

@end

@implementation ImageTableViewCell

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
    [self.contentView addSubview:self.iconImageView];
}

#pragma mark --- lazy ---
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 350)];
        _iconImageView.image = kImageName(@"iconImage.jpg");
    }
    return _iconImageView;
}

@end
