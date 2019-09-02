//
//  ShowListLayout.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ShowListLayout.h"

//瀑布流的列数
static NSInteger CXcolumnCount = 2;
//瀑布流的内边距
static UIEdgeInsets CXdefaultEdgeInsets = {20,15,10,15};
//cell的列间距
static NSInteger CXcolumnMagin = 10;
//cell的行间距
static NSInteger CXrowMagin = 10;

@interface ShowListLayout ()

//存放所有cell 的布局属性
@property (nonatomic, strong) NSMutableArray * CXattrsArray;
//缩放所有列的高度
@property (nonatomic, strong) NSMutableArray * CXcolumnHeights;

@end

@implementation ShowListLayout

#pragma mark - <懒加载>
- (NSMutableArray *)CXattrsArray{
    if (!_CXattrsArray) {
        _CXattrsArray = [NSMutableArray array];
    }
    return _CXattrsArray;
}

- (NSMutableArray *)CXcolumnHeights{
    if (!_CXcolumnHeights) {
        _CXcolumnHeights = [NSMutableArray array];
    }
    return _CXcolumnHeights;
}
#pragma mark - <准备布局>
//准备布局（布局前自动执行）
- (void) prepareLayout{
    //重写此方法一定要记得super
    [super prepareLayout];
    
    //在实际操作中我们的数据并不会固定不变的，因此我们每次布局前最好要清空之前存储的属性
    //清空存放所有列的高度
    //清空存放所有cell的不去属性
    [self.CXcolumnHeights removeAllObjects];
    [self.CXattrsArray removeAllObjects];
    //首先为第一行的cell附高度
    for (NSInteger i = 0; i < CXcolumnCount; i ++) {
        //数组里只能存放对象
        [self.CXcolumnHeights addObject:@(CXdefaultEdgeInsets.top)];
    }
    //下面开始创建每一个cell的布局属性 并且添加到存储cell布局属性的数组中
    //cell总个数 因为这里只要一个section
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i ++) {
        // 创建位置 即indexPath
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //获取indexPath对应的cell布局属性
        UICollectionViewLayoutAttributes * attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        //把获取到的布局属性添加到数组中
        [self.CXattrsArray addObject:attributes];
    }
    //准备布局的工作到这里就结束了
}
//返回所有cell布局属性 及整体cell 的排布
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.CXattrsArray;
}
//返回cell 的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    //创建布局属性
    UICollectionViewLayoutAttributes * CXattributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //下面的一部分是获取cell的frame（布局属性）
    CGFloat width;
    CGFloat height;
    CGFloat X;
    CGFloat Y;
    //获取width
//    width = (collectionViewWidth - CXdefaultEdgeInsets.left - CXdefaultEdgeInsets.right - (CXcolumnCount - 1) * CXcolumnMagin) / CXcolumnCount;
    width = ([UIScreen mainScreen].bounds.size.width - 30)/2.0;
    //        CGFloat itemH = itemW * 256 / 180;
    //获取height
    //在实际开发中heigh并不是真正的随机 而是根据数据来决定height 在这里展示初步的介绍其原理 因此采用大于100小于150的随机数
    height = width * 256 / 180 + arc4random_uniform(50);
    //获取X （瀑布流的实现重点就在cell的X，Y值获取）
    //设置一个列数的中间变量
    NSInteger tempColumn = 0;
    //设置高度小的中间变量 在这里我们把第0列的高度给他，这样可以减少循环次数，提高效率
    CGFloat minColumnHeight = [self.CXcolumnHeights[0] doubleValue];
    for (NSInteger i = 1; i < CXcolumnCount; i ++) {
        if (minColumnHeight > [self.CXcolumnHeights[i] doubleValue]) {
            minColumnHeight = [self.CXcolumnHeights[i] doubleValue];
            tempColumn = i;
        }
    }
    X = CXdefaultEdgeInsets.left + (width + CXcolumnMagin) * tempColumn;
    //获取Y
    Y = minColumnHeight;
    if (Y != CXdefaultEdgeInsets.top) {
        Y += CXrowMagin;
    }
    //设置cell的frame
    CXattributes.frame = CGRectMake(X, Y, width, height);
    //更新高度最矮的那列的高度
    self.CXcolumnHeights[tempColumn] = @(CGRectGetMaxY(CXattributes.frame));
    
    return CXattributes;
}
//返回collegeView的Content的大小
- (CGSize)collectionViewContentSize{
    //虽说返回的是大小，但是我们这里主要的是height
    CGFloat maxColumnHeight = [self.CXcolumnHeights[0] doubleValue];
    for (NSInteger i = 1; i < CXcolumnCount; i++) {
        
        CGFloat columnHeight = [self.CXcolumnHeights[i] doubleValue];
        
        if (maxColumnHeight < columnHeight) {
            maxColumnHeight = columnHeight;
        }
    }
    return CGSizeMake(0, maxColumnHeight + CXdefaultEdgeInsets.bottom);
    
}
@end
