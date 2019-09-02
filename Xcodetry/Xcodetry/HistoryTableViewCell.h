//
//  HistoryTableViewCell.h
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HistoryTableViewCell : UITableViewCell
@property (nonatomic, strong)NSArray<NSString *> *showProductArray;
@property (nonatomic, copy) void (^clickCellLabelBlock)(NSString *clickString);
@end

NS_ASSUME_NONNULL_END
