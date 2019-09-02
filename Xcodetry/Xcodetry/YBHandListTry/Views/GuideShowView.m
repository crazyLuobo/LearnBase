//
//  GuideShowView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/26.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "GuideShowView.h"
#import "GuideBottomShowView.h"
@interface GuideShowView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *backScorllView;
@property (nonatomic, strong) GuideBottomShowView *guideBottomView;
@end


@implementation GuideShowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutGuideShowView];
    }
    return self;
}



#pragma mark - 布局

- (void)layoutGuideShowView
{
    [self addSubview:self.backScorllView];
    [self.backScorllView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    [self addSubview:self.guideBottomView];
    [self.guideBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).offset(-60);
        make.left.mas_equalTo(self.mas_left).offset(100);
        make.right.mas_equalTo(self.mas_right).offset(-100);
        make.height.equalTo(@(10));
    }];
    
    
}

#pragma mark - UIScrollViewDelete

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.guideBottomView setBottomShowBaseWidthProportion:scrollView.contentOffset.x];
}

#pragma mark - getter and setter
- (void)setShowScrollViewArray:(NSArray<UIView *> *)showScrollViewArray
{
    _showScrollViewArray = showScrollViewArray;
    
    UIView *container = [UIView new];
    [self.backScorllView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.backScorllView);
        make.height.equalTo(self.backScorllView);
    }];
   
    UIView *lastView = nil;
    for ( int i = 0 ; i < showScrollViewArray.count ; i++ )
    {
        UIView *view = showScrollViewArray[i];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(container);
            make.width.mas_equalTo(@([UIScreen mainScreen].bounds.size.width));
            if ( lastView )
            {
                make.left.mas_equalTo(lastView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(container.mas_left);
            }
        }];
        
        lastView = view;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView.mas_right);
    }];
   
    
}

- (void)setShowBottomColorArray:(NSArray<UIColor *> *)showBottomColorArray
{
    _showBottomColorArray = showBottomColorArray;
    self.guideBottomView.showDiffColorArray = showBottomColorArray;
    
}

-(UIScrollView *)backScorllView
{
    if (!_backScorllView) {
        _backScorllView = [[UIScrollView alloc] init];
        _backScorllView.backgroundColor = [UIColor whiteColor];
        _backScorllView.pagingEnabled = YES;
        _backScorllView.delegate = self;
        _backScorllView.showsVerticalScrollIndicator = NO;
        _backScorllView.showsHorizontalScrollIndicator = NO;
   
    }
    return _backScorllView;
}

- (GuideBottomShowView *)guideBottomView
{
    if (!_guideBottomView) {
        _guideBottomView = [[GuideBottomShowView alloc]init] ;
    }
    return _guideBottomView;
}


@end
