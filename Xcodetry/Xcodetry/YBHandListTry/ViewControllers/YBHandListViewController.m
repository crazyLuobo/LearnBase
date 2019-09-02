//
//  YBHandListViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/26.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "YBHandListViewController.h"
#import "YBListCollectionViewCell.h"

@interface YBHandListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UICollectionView *contentCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *girdLayout;
@property (nonatomic, strong) UICollectionViewFlowLayout *listLayout;
@property (nonatomic, assign) BOOL isList;// 用于判断是列表的还是块状的

@end

@implementation YBHandListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.isList = YES;
    [self layoutYBHandListViewController];
}



#pragma mark - 私有方法

- (void)clickHeader
{
    self.isList = !self.isList;
    if (self.isList) {
        [self.contentCollectionView setCollectionViewLayout:self.listLayout animated:YES completion:^(BOOL finished) {
            
        }];
    }else{
        [self.contentCollectionView setCollectionViewLayout:self.girdLayout animated:YES completion:^(BOOL finished) {
            
        }];
    }
}

#pragma mark - UICollectionViewDelegate and UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YBListCollectionViewCell   *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionView" forIndexPath:indexPath];
    return cell;
}


#pragma mark - 布局

- (void)layoutYBHandListViewController
{
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(84));
    }];
    
    [self.view addSubview:self.contentCollectionView];
}

#pragma mark - getter and setter

- (UICollectionViewFlowLayout *)girdLayout
{
    if (!_girdLayout) {
        _girdLayout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat width = (self.view.bounds.size.width - 10)/2.0;
        _girdLayout.itemSize = CGSizeMake(width, width + 100);
        _girdLayout.minimumLineSpacing = 5;
        _girdLayout.minimumInteritemSpacing = 5;
        _girdLayout.sectionInset = UIEdgeInsetsZero;
        
    }
    return _girdLayout;
}

- (UICollectionViewFlowLayout *)listLayout
{
    if (!_listLayout) {
        _listLayout = [[UICollectionViewFlowLayout alloc] init];
        _listLayout.itemSize = CGSizeMake(self.view.bounds.size.width, 180);
        _listLayout.minimumInteritemSpacing  = 5;
        _listLayout.minimumLineSpacing = 5;
        _listLayout.sectionInset = UIEdgeInsetsZero;
    }
    return _listLayout;
}
- (UICollectionView *)contentCollectionView
{
    if (!_contentCollectionView) {
        _contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 84, self.view.bounds.size.width, self.view.bounds.size.height - 84) collectionViewLayout:self.girdLayout];
        _contentCollectionView.backgroundColor = [UIColor whiteColor];
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
        [_contentCollectionView registerClass:[YBListCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionView"];
        
        
    }
    return _contentCollectionView;
}
- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [UIView new];
        _headerView.backgroundColor = [UIColor grayColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeader)];
        [_headerView addGestureRecognizer:tap];
    }
    return _headerView;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
