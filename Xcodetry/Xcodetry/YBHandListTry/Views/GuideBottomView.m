//
//  GuideBottomView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/23.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "GuideBottomView.h"
@interface GuideBottomView()

@property (nonatomic, strong) UIView *spaceMaskView;

@end
@implementation GuideBottomView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.spaceWidth = 50;
        self.spaceHeight = 10;
        self.maskView = self.spaceMaskView;
    }
    return self;
}



- (void)setScrollToIndex:(NSInteger)index
{
    if (index > self.showColorArray.count - 1) {
        self.spaceMaskView.frame = CGRectMake(0, 0, self.spaceWidth, self.spaceHeight);
        return;
    }
    CGRect frame = self.spaceMaskView.frame;
    frame.origin.x += self.spaceWidth;
    self.spaceMaskView.frame = frame;
}



#pragma mark - getter and setter

- (void)setShowColorArray:(NSArray *)showColorArray
{
    
    _showColorArray = showColorArray;
    for (int i = 0; i < showColorArray.count; i++) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = showColorArray[i];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(self.mas_left).offset(self.spaceWidth * i);
            make.width.equalTo(@(self.spaceWidth));
            make.height.equalTo(@(self.spaceHeight));
        }];
       
    }
    
}


- (UIView *)spaceMaskView
{
    if (!_spaceMaskView) {
        _spaceMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.spaceWidth, self.spaceHeight)];
        _spaceMaskView.backgroundColor = [UIColor blueColor];
    }
    return _spaceMaskView;
}




@end
