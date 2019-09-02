//
//  NewsListTopSelectView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/22.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "NewsListTopSelectView.h"
@interface NewsListTopSelectView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIScrollView *backScorllView;
@property (nonatomic, assign) int nowSelectIndex;
@property (nonatomic, strong) NSMutableArray *allSelectLabelArray;
@property (nonatomic, strong) UIImageView *moreSelectView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) NSMutableArray *allLabelFrameArray;
@property (nonatomic, assign) CGFloat currentOffset;
@property (nonatomic, strong) UIView *blackBackView;

@end

@implementation NewsListTopSelectView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutNewsListTopSelectView];
        self.nowSelectIndex = 1;
        self.currentOffset = 0;
        
      
    }
    return self;
}



#pragma mark - 对外方法

- (void)setSelectLabelWithIndex:(NSInteger)selectIndex
{
    [self changeSelectIndexWithSelectIndex:(int)selectIndex];
}

- (void)setSelectLabelScrollWithContentOffset:(CGFloat)offset
{
    NSInteger index = offset/KSCREEN_WIDTH;
    
    
    NSString *nilString = NSStringFromCGRect(CGRectMake(0, 0, 0, 0));
 
    if (offset - index*KSCREEN_WIDTH >= 0) {
        CGFloat nowOffset = offset - index*KSCREEN_WIDTH;
        if (offset > self.currentOffset) {// 正向
            NSString *rectSting = index+1 <= self.allLabelFrameArray.count - 1?self.allLabelFrameArray[index + 1]:nilString;
            CGRect nextFrame = CGRectFromString(rectSting);
            CGRect nowFrame = self.maskView.frame;
            NSLog(@"fdsfkdkfkjlsd%f",nowOffset/KSCREEN_WIDTH * nowFrame.size.width);
            nowFrame.origin.x = nowOffset/KSCREEN_WIDTH * nowFrame.size.width + [self returnAllShowLabelWidthWithIndex:index];
            nowFrame.size.width = nowFrame.size.width - nowOffset/KSCREEN_WIDTH * nowFrame.size.width +nowOffset/KSCREEN_WIDTH * nextFrame.size.width;
            
            self.maskView.frame = nowFrame;
        }else{
            NSString *rectSting = index - 1>=0 ? self.allLabelFrameArray[index - 1]:nilString;
            CGRect nextFrame = CGRectFromString(rectSting);
            CGRect nowFrame = self.maskView.frame;
            NSLog(@"fdsfkdkfkjlsd%f",nowOffset/KSCREEN_WIDTH * nowFrame.size.width);
            nowFrame.origin.x = nowOffset/KSCREEN_WIDTH * nowFrame.size.width + [self returnAllShowLabelWidthWithIndex:index];;
            nowFrame.size.width = nowFrame.size.width - nowOffset/KSCREEN_WIDTH * nowFrame.size.width +nowOffset/KSCREEN_WIDTH * nextFrame.size.width;
            
            self.maskView.frame = nowFrame;
        }
        self.currentOffset = offset;

    }else{
        self.maskView.frame = CGRectMake(0, 0, 100, 100);
    }
}


#pragma mark - 私有方法
- (void)clickTapLabel:(UITapGestureRecognizer *)tap
{
    UILabel *nowSelectLabel  = (UILabel *)tap.view;
    [self changeSelectIndexWithSelectIndex:(int)(nowSelectLabel.tag - 1000)];
    if (self.clickSelectViewBlock) {
        self.clickSelectViewBlock(nowSelectLabel.text,self.nowSelectIndex);
    }
}

- (void)changeSelectIndexWithSelectIndex:(int)selectIndex
{
    UILabel *pastLabel = self.allSelectLabelArray[self.nowSelectIndex];
    pastLabel.textColor = [UIColor blackColor];
    UILabel *nowSelectLabel = self.allSelectLabelArray[selectIndex];
    nowSelectLabel.textColor = [UIColor redColor];
    self.nowSelectIndex = (int)selectIndex;
    if (nowSelectLabel.center.x > 160 &&self.backScorllView.contentSize.width - nowSelectLabel.center.x > 160) {
        [self.backScorllView setContentOffset:CGPointMake(nowSelectLabel.center.x-160, 0) animated:YES];
    }else if (nowSelectLabel.center.x < 160)
    {
        [self.backScorllView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}


- (void)clickAllStyleAction
{
    if (self.clickAllStyleBlock) {
        self.clickAllStyleBlock();
    }
}

- (CGFloat)returnAllShowLabelWidthWithIndex:(NSInteger)index
{
    CGFloat width = 0;
    for (int i = 0; i<index; i++) {
        NSString *rectSting = self.allLabelFrameArray[i];
        CGRect rectFrame = CGRectFromString(rectSting);
        width+=rectFrame.size.width;
    }
    return width;
}

#pragma mark - 页面布局

- (void)layoutNewsListTopSelectView
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bottomLineView];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    [self addSubview:self.backScorllView];
    [self.backScorllView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right).offset(-70);
        make.bottom.mas_equalTo(self.bottomLineView.mas_top);
    }];
    
    [self addSubview:self.moreSelectView];
    [self.moreSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backScorllView.mas_right).offset(35);
        make.centerY.mas_equalTo(self.backScorllView.mas_centerY);
        make.height.width.equalTo(@(24));
        
    }];
}

#pragma mark - getter and setter

- (void)setShowTypeArray:(NSArray *)showTypeArray
{
    _showTypeArray = showTypeArray;
    CGFloat totalWidth = 30;
    self.allSelectLabelArray = [NSMutableArray array];
    for (int i = 0; i < showTypeArray.count; i++) {
        NSString *titleStr = showTypeArray[i];
        UILabel *showLabel = [[UILabel alloc] init];
        showLabel.tag = 1000 + i;
        showLabel.text = titleStr;
        showLabel.font = [UIFont systemFontOfSize:20];
        showLabel.userInteractionEnabled = YES;
        [self.allSelectLabelArray addObject:showLabel];
        if (self.nowSelectIndex == i) {
            showLabel.textColor = [UIColor redColor];
        }else{
            showLabel.textColor = [UIColor  blackColor];
        }
        
        
        
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTapLabel:)];
        [showLabel addGestureRecognizer:tap];
        CGSize size = [titleStr sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20.0f]}];
        [self.backScorllView addSubview:showLabel];
        [showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.backScorllView.mas_left).offset(totalWidth);
            make.centerY.mas_equalTo(self.backScorllView.mas_centerY);
            make.width.equalTo(@(size.width+10));
        }];
        
        CGRect frame = CGRectMake(totalWidth, 0, size.width + 30, 50);
        [self.allLabelFrameArray addObject:NSStringFromCGRect(frame)];
        totalWidth += (size.width + 30);
        
    }
    
    self.backScorllView.contentSize = CGSizeMake(totalWidth, self.bounds.size.height);

}
- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor grayColor];
    }
    return _bottomLineView;
}

- (UIScrollView *)backScorllView
{
    if (!_backScorllView) {
        _backScorllView = [[UIScrollView alloc] init];
        _backScorllView.showsVerticalScrollIndicator = NO;
        _backScorllView.showsHorizontalScrollIndicator = NO;
        _backScorllView.delegate = self;
        self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.maskView.backgroundColor = [UIColor redColor];
        _backScorllView.maskView = self.maskView;
    }
    return _backScorllView;
}


- (UIImageView *)moreSelectView
{
    if (!_moreSelectView) {
        _moreSelectView = [[UIImageView alloc] init];
        _moreSelectView.image = [UIImage imageNamed:@"select_more"];
        _moreSelectView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAllStyleAction)];
        [_moreSelectView addGestureRecognizer:tap];
    }
    return _moreSelectView;
}

- (NSMutableArray *)allLabelFrameArray
{
    if (!_allLabelFrameArray) {
        _allLabelFrameArray = [NSMutableArray array];
    }
    return _allLabelFrameArray;
}

@end
