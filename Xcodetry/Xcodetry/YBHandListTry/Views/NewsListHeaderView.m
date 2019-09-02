//
//  NewsListHeaderView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/22.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "NewsListHeaderView.h"
@interface NewsListHeaderView()
@property (nonatomic, strong) UIView *searchBackView;// 搜索框背景
@property (nonatomic, strong) UIImageView *searchIconImageView;// 搜索Icon
@property (nonatomic, strong) UILabel *searchContentLabel;// 搜索输入框展示内容
@property (nonatomic, strong) UIImageView *releasePhotoView;

@end
@implementation NewsListHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self layoutNewsListHeaderView];
    }
    return self;
}

#pragma mark - 页面布局
- (void)layoutNewsListHeaderView
{
    [self addSubview:self.searchBackView];
    [self.searchBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(60);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.right.mas_equalTo(self.mas_right).offset(-90);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-8);
    }];
   
    [self addSubview:self.searchContentLabel];
    [self.searchContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.searchBackView.mas_left).offset(30);
        make.right.mas_equalTo(self.searchBackView.mas_right).offset(-20);
        make.centerY.mas_equalTo(self.searchBackView.mas_centerY);
    }];
    
    [self.searchBackView addSubview:self.searchIconImageView];
    [self.searchIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.searchBackView.mas_left).offset(10);
        make.width.equalTo(@(16));
        make.height.equalTo(@(16));
        make.centerY.mas_equalTo(self.searchBackView.mas_centerY);
        
    }];
    
    [self addSubview:self.releasePhotoView];
    [self.releasePhotoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.searchBackView.mas_centerY);
        make.centerX.mas_equalTo(self.searchBackView.mas_right).offset(45);
        make.width.height.equalTo(@(35));
    }];
    
}


#pragma mark - getter and setter

- (UIView *)searchBackView
{
    if (!_searchBackView) {
        _searchBackView = [[UIView alloc] init];
        _searchBackView.backgroundColor = [UIColor whiteColor];
        _searchBackView.layer.cornerRadius = 6;
    }
    return _searchBackView;
}

- (UILabel *)searchContentLabel
{
    if (!_searchContentLabel) {
        _searchContentLabel = [[UILabel alloc]init];
        _searchContentLabel.font = [UIFont systemFontOfSize:15];
        _searchContentLabel.textColor = [UIColor blackColor];
        _searchContentLabel.text = @"是不是你要看他啊|中央最新文件";
    }
    return _searchContentLabel;
}

- (UIImageView *)searchIconImageView
{
    if (!_searchIconImageView) {
        _searchIconImageView = [[UIImageView alloc] init];
        _searchIconImageView.image = [UIImage imageNamed:@"search"];
    }
    return _searchIconImageView;
}

- (UIImageView *)releasePhotoView
{
    if (!_releasePhotoView) {
        _releasePhotoView = [[UIImageView alloc] init];
        _releasePhotoView.image = [UIImage imageNamed:@"news_search_photo"];
        _releasePhotoView.backgroundColor = [UIColor whiteColor];
    }
    return _releasePhotoView;
}



@end
