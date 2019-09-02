//
//  YBListCollectionViewCell.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/27.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "YBListCollectionViewCell.h"
@interface YBListCollectionViewCell()
@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end
@implementation YBListCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutYBListCollectionViewCell];
    }
    return self;
}

#pragma mark - getter and setter


- (void)layoutYBListCollectionViewCell
{
    [self.contentView addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@(100));
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerView.mas_bottom).offset(10);
        make.left.right.equalTo(self.contentView);
    }];
    [self.contentView addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.contentView);
    }];
}

- (UIImageView *)headerView
{
    if (!_headerView) {
        _headerView = [UIImageView new];
        _headerView.image = [UIImage imageNamed:@"header"];
    }
    return _headerView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor blueColor];
        _titleLabel.text = @"这个是主体这个是主题这个是主题";
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textColor = [UIColor blueColor];
        _detailLabel.text = @"就是这个玩意啊大家小心啊";
    }
    return _detailLabel;
}

@end
