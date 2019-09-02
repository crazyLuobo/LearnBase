//
//  GuideShowView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/8/26.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuideShowView : UIView

@property (nonatomic, strong) NSArray<UIView *> *showScrollViewArray;// 用于存放显示的View数组
@property (nonatomic, strong) NSArray<UIColor *> *showBottomColorArray;// 用于存放显示下边的颜色数组

@end

NS_ASSUME_NONNULL_END
