
//
//  GrayGapTableViewCell.m
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/18.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "GrayGapTableViewCell.h"

@implementation GrayGapTableViewCell

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
    self.backgroundColor = UIColorFromRGB(0xf5f5f5);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = kRGB(234,235,240).CGColor;    
}


@end
