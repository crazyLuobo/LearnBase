//
//  GuideBottomShowView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/23.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "GuideBottomShowView.h"
@interface GuideBottomShowView()
@property (nonatomic, strong) UIView *lineBackView;
@property (nonatomic, strong) UIView *backMaskView;
@property (nonatomic, assign) CGFloat spaceLineWidth;

@end
@implementation GuideBottomShowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        self.duration = 0.5;
        [self layoutGuideBottomShowView];
    }
    return self;
}

#pragma mark - 对外方法

- (void)setBottomShowIndex:(NSInteger)selectIndex
{
    if (selectIndex < self.showDiffColorArray.count) {
        [UIView animateWithDuration:self.duration animations:^{
            CGRect frame = self.backMaskView.frame;
            frame.origin.x = selectIndex * frame.size.width;
            self.backMaskView.frame = frame;
        }];
    }
}

- (void)setBottomShowBaseWidthProportion:(CGFloat)proporiton
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    NSInteger index = proporiton/width;

    CGFloat protp  = (proporiton - width * index)/width;
    CGRect frame = self.backMaskView.frame;
    frame.origin.x= protp * frame.size.width + index * self.backMaskView.frame.size.width;
    self.backMaskView.frame = frame;
}


#pragma mark - 布局
// 系统方法，通过调用此方法获取布局后需要的view的实际frame
- (void)layoutSubviews {
    [super layoutSubviews];
    // 获取到约束后的控件frame
    NSLog(@"这就是这个view的宽 %f",self.frame.size.width);
    if (self.showDiffColorArray.count > 0) {
        self.spaceLineWidth = self.frame.size.width/self.showDiffColorArray.count;
        CGRect frame = self.backMaskView.frame;
        frame.size.width = self.spaceLineWidth;
        self.backMaskView.frame = frame;
    }
}
- (void)layoutGuideBottomShowView
{
    [self addSubview:self.lineBackView];
    [self.lineBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}
#pragma mark - getter and setter


- (void)setShowDiffColorArray:(NSArray<UIColor *> *)showDiffColorArray
{
    _showDiffColorArray = showDiffColorArray;
    NSMutableArray *showLineViewArr = [NSMutableArray array];
    for (int i = 0; i < showDiffColorArray.count; i++) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = showDiffColorArray[i];
        [showLineViewArr addObject:lineView];
        [self.lineBackView addSubview:lineView];
    }
    [showLineViewArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [showLineViewArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.lineBackView);
    }];
    
}
- (UIView *)lineBackView
{
    if (!_lineBackView) {
        _lineBackView = [[UIView alloc] init];
        _lineBackView.maskView = self.backMaskView;
        _lineBackView.backgroundColor = [UIColor blueColor];
    }
    return _lineBackView;
}

- (UIView *)backMaskView
{
    if (!_backMaskView) {
        _backMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        _backMaskView.backgroundColor = [UIColor whiteColor];
    }
    return _backMaskView;
}

@end
