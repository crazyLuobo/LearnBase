//
//  ShowListCollectionViewCell.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ShowListCollectionViewCell.h"
#import <Masonry.h>
@interface ShowListCollectionViewCell()
@property (nonatomic, strong)UIImageView *contentImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *priceLabel;

@end
@implementation ShowListCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutShowListCollectionViewCell];
    }
    return self;
}


- (void)layoutShowListCollectionViewCell
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemW = (width - 30)/2.0;
    CGFloat itemH = itemW * 256 / 180;
    [self.contentView addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
//        make.height.equalTo(@(itemH - 80));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-80);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentImageView.mas_bottom).offset(15);
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.right.mas_equalTo(self.contentView.mas_right).offset(15);
    }];
    
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right).offset(15);
    }];
    
}




- (UIImageView *)contentImageView
{
    if (!_contentImageView) {
        _contentImageView = [UIImageView new];
        _contentImageView.image = [UIImage imageNamed:@"return"];
    }
    return _contentImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"海老板特大咸鸭蛋20枚";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.text = @"￥29.8";
        _priceLabel.textColor = [UIColor blackColor];
    }
    return _priceLabel;
}
@end
