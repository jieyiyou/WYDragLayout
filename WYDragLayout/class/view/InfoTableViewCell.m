
//
//  InfoTableViewCell.m
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/17.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "InfoTableViewCell.h"

@interface InfoTableViewCell()

//名称
@property (nonatomic,strong) UILabel *nameLabel;

//价格
@property (nonatomic,strong) UILabel *priceLabel;

@property (nonatomic,strong)UILabel *limitLabel;

@property (nonatomic,strong)UILabel *numberLabel;

@end

@implementation InfoTableViewCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.limitLabel];
    [self.contentView addSubview:self.numberLabel];
}

#pragma mark --- lazy ---
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, kScreenWidth - 2*10, 40)];
        _nameLabel.text = @"【黔鑫】石阡特产棒棒牛肉干麻辣味112g*2袋-佛顶山黄肉  古法秘制";
        _nameLabel.font = kFont(16);
        _nameLabel.textColor = UIColorFromRGB(0x333333);
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.nameLabel.frame.origin.y + self.nameLabel.frame.size.height + 15, kScreenWidth, 20)];
        _priceLabel.text = @"￥49.90";
        _priceLabel.font = kFont(14);
        _priceLabel.textColor = UIColorFromRGB(0xf02b2b);
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (UILabel *)limitLabel
{
    if (!_limitLabel) {
        _limitLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.frame.origin.x, self.priceLabel.frame.origin.y + self.priceLabel.frame.size.height + 20,kScreenWidth / 2.0 , 20)];
        _limitLabel.text = @"限量：100袋";
        _limitLabel.font = kFont(14);
        _limitLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _limitLabel;
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.limitLabel.frame.origin.x, self.limitLabel.frame.origin.y + self.limitLabel.frame.size.height + 15, kScreenWidth / 2.0, 20)];
        _numberLabel.text = @"人气：1595";
        _numberLabel.font = kFont(14);
        _numberLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _numberLabel;
}

@end
