//
//  GuideBottomView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/8/23.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuideBottomView : UIView

@property (nonatomic, assign) CGFloat spaceWidth;
@property (nonatomic, assign) CGFloat spaceHeight;
@property (nonatomic, strong) NSArray *showColorArray;

- (void)setScrollToIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
