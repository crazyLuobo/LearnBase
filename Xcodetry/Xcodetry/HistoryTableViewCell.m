//
//  HistoryTableViewCell.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "HistoryTableViewCell.h"
#import <Masonry.h>

@implementation HistoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setShowProductArray:(NSArray<NSString *> *)showProductArray
{
    for (UIView *view in self.contentView.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
        }
    }
    CGFloat totalwidth = 20;
    for (int i = 0; i<showProductArray.count; i++) {
        NSString *showString = showProductArray[i];
        UILabel *label = [self returnShowLabelWithShowString:showString];
        CGSize size = [showString sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]}];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(10*i+ totalwidth);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.equalTo(@(size.width + 20));
            make.height.equalTo(@(size.height+16));
        }];
        totalwidth += size.width + 20;
        
    }
}

- (UILabel *)returnShowLabelWithShowString:(NSString *)showString
{
    UILabel *showLabel = [[UILabel alloc]init];
    showLabel.text = showString;
    showLabel.font = [UIFont systemFontOfSize:12];
    showLabel.textColor = [UIColor blackColor];
    showLabel.layer.cornerRadius = 15;
    showLabel.layer.borderColor = [UIColor blackColor].CGColor;
    showLabel.layer.borderWidth = 0.5;
    showLabel.textAlignment = NSTextAlignmentCenter;
    showLabel.userInteractionEnabled = YES;
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickContentLabel:)];
    [showLabel addGestureRecognizer:tap];
    return showLabel;
}

- (void)clickContentLabel:(UITapGestureRecognizer *)tap{
    UILabel *showLabel = (UILabel *)tap.view;
    NSLog(@"%@",showLabel.text);
    if (self.clickCellLabelBlock) {
        self.clickCellLabelBlock(showLabel.text);
    }
}

@end
