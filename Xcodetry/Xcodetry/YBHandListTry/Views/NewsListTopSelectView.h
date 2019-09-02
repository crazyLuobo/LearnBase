//
//  NewsListTopSelectView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/8/22.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface NewsListTopSelectView : UIView
@property (nonatomic, strong) NSArray *showTypeArray;
@property (nonatomic, copy) void (^clickSelectViewBlock)(NSString *selectString,NSInteger selectIndex);
@property (nonatomic, copy) void (^clickAllStyleBlock)(void);

- (void)setSelectLabelWithIndex:(NSInteger)selectIndex;
- (void)setSelectLabelScrollWithContentOffset:(CGFloat)offset;
@end

NS_ASSUME_NONNULL_END
