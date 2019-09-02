//
//  GuideBottomShowView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/8/23.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuideBottomShowView : UIView

@property (nonatomic, assign) CGFloat duration;// 滑动时间间隔（默认是0.5）
@property (nonatomic, strong) NSArray<UIColor *> *showDiffColorArray;// 展示不同颜色的数组


/**
 设置滑动的位置
 @param selectIndex 滑动位置（从零开始）
 */
- (void)setBottomShowIndex:(NSInteger)selectIndex;



/**
 设置滑动位置的比例 主要是用于与是从scrollView的联合使用

 @param proporiton 滑动的比例
 */
- (void)setBottomShowBaseWidthProportion:(CGFloat)proporiton;

@end

NS_ASSUME_NONNULL_END
