//
//  SearchTopView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchTopView : UIView
@property (nonatomic, copy)NSString *searchShowStr;
@property (nonatomic, copy) void (^clickReturnBlock)(void);
@property (nonatomic, copy) void (^clickCancleBtnBlock)(void);
@property (nonatomic, copy) void (^inputNewSearchKeyBlock)(NSString *searchKey);

- (void)cancleKeyBoard;



@end

NS_ASSUME_NONNULL_END
