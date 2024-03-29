//
//  YBHCollectionCellConfig.h
//  YBHandyListDemo
//
//  Created by 杨波 on 2019/6/18.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "YBHCollectionCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 UICollectionView cell 配置协议
 */
@protocol YBHCollectionCellConfig <NSObject>

@required

/** cell 的类类型 */
- (Class<YBHCollectionCellProtocol>)ybhc_cellClass;

@optional

/** cell 对应的数据模型 */
- (id)ybhc_model;

/** cell 的默认大小 (优先级低于 YBHCollectionCellProtocol 代理方法返回的高度) */
- (CGSize)ybhc_defaultSize;

/** cell 的复用标识 */
- (NSString *)ybhc_cellReuseIdentifier;

@end


/**
 配置默认实现类，一般业务就够用了
 */
@interface YBHCollectionCellConfig : NSObject <YBHCollectionCellConfig>

/** cell 的类类型 */
@property (nonatomic, strong) Class<YBHCollectionCellProtocol> cellClass;

/** cell 对应的数据模型 */
@property (nonatomic, strong) id model;

/** cell 的默认大小 (优先级低于 YBHCollectionCellProtocol 代理方法返回的高度) */
@property (nonatomic, assign) CGSize defaultSize;

/** cell 的复用标识 */
@property (nonatomic, copy) NSString *cellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
