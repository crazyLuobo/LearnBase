//
//  ViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ViewController.h"

#import "ShowListViewController.h"
#import "SearchTopView.h"
#import <Masonry.h>
#import "HistoryTableViewCell.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)SearchTopView *searchTopView;
@property (nonatomic, strong)UITableView *contentTableView;
@property (nonatomic, strong)NSArray *sectionContentArray;
@property (nonatomic, strong)NSArray *historyShowArray;
@property (nonatomic, strong)NSArray *hotSearchShowArray;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutViewController];
    
}

- (void)layoutViewController{
    [self.view addSubview:self.searchTopView];
    [self.searchTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.left.top.equalTo(self.view);
        make.height.equalTo(@(100));
    }];
    
    [self.view addSubview:self.contentTableView];
    [self.contentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.searchTopView.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(20);
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
         return [self returnShowCellContent:[self returnHistory]].count;
    }else{
        return [self returnShowCellContent:self.hotSearchShowArray].count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indifier = @"tableCell";
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indifier];
   
    if (!cell) {
        cell = [[HistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indifier];
    }
    
  
    if (indexPath.section == 0) {
//        cell.showProductArray = [self returnHistory];
        NSArray *historyArray = [self returnShowCellContent:[self returnHistory]];
        cell.showProductArray = historyArray[indexPath.row];
    }else{
       NSArray *array = [self returnShowCellContent:self.hotSearchShowArray];
        cell.showProductArray = array[indexPath.row];
    }
    __weak ViewController *weakSelf = self;
    cell.clickCellLabelBlock = ^(NSString * _Nonnull clickString) {
        ShowListViewController *showVC = [[ShowListViewController alloc] init];
        showVC.searchShowStr = clickString;
        [weakSelf.navigationController pushViewController:showVC animated:YES];
    };

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *secitonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    secitonView.backgroundColor = [UIColor whiteColor];
    
    UILabel *sectionLabel = [[UILabel alloc] init];
    sectionLabel.text = self.sectionContentArray[section];
    [secitonView addSubview:sectionLabel];
    [sectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(secitonView.mas_left).offset(15);
        make.centerY.mas_equalTo(secitonView.mas_centerY);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    if (section == 0) {
        UIImageView *cancleImageView = [[UIImageView alloc] init];
        cancleImageView.image = [UIImage imageNamed:@"return"];
        [secitonView addSubview:cancleImageView];
        [cancleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(secitonView.mas_right).offset(-15);
            make.centerY.mas_equalTo(secitonView.mas_centerY);
            make.width.equalTo(@(20));
            make.height.equalTo(@(20));
        }];
    }
    return secitonView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footSectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 15)];
    footSectionView.backgroundColor = [UIColor grayColor];
    return footSectionView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ShowListViewController *showVC = [[ShowListViewController alloc] init];
//    [self.navigationController pushViewController:showVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchTopView cancleKeyBoard];
}

- (NSArray *)returnHistory
{
    NSArray *history = [[NSUserDefaults standardUserDefaults] objectForKey:@"History"];
    if (history != nil) {
        return history;
    }else{
        return [NSArray array];
    }
}

- (NSArray *)returnShowCellContent:(NSArray *)showContentArray
{
    CGFloat totalwidth = 20;
    NSMutableArray *contentArray = [NSMutableArray array];
    NSMutableArray *contentRowArray = [NSMutableArray array];
    for (int i = 0; i<showContentArray.count; i++) {
        NSString *showString = showContentArray[i];
        CGSize size = [showString sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]}];
        totalwidth += size.width + 20;
        if (totalwidth < [UIScreen mainScreen].bounds.size.width - 10) {
            [contentRowArray addObject:showContentArray[i]];
            if (i == showContentArray.count - 1) {
                [contentArray addObject:contentRowArray];
            }
        }else{
            [contentArray addObject:contentRowArray];
            contentRowArray = [NSMutableArray array];
            totalwidth = 20;
        }
        
    }
    return contentArray;
}


- (UITableView *)contentTableView
{
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] init];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
        _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _contentTableView;
}

- (SearchTopView *)searchTopView
{
    if (!_searchTopView) {
        _searchTopView = [[SearchTopView alloc]init];
        _searchTopView.searchShowStr = @"短袖男";
        __weak ViewController *weakSelf = self;
        _searchTopView.inputNewSearchKeyBlock = ^(NSString * _Nonnull searchKey) {
            ShowListViewController *showVC = [[ShowListViewController alloc] init];
            showVC.searchShowStr = searchKey;
            [weakSelf.navigationController pushViewController:showVC animated:YES];
        };
      
    }
    return _searchTopView;
}

- (NSArray *)sectionContentArray
{
    if (!_sectionContentArray) {
        _sectionContentArray = @[@"历史记录",@"热门搜索"];
    }
    return _sectionContentArray;
}

- (NSArray *)hotSearchShowArray
{
    if (!_hotSearchShowArray) {
        _hotSearchShowArray = @[@"历史记录",@"热门搜索",@"热门搜索",@"热门搜索",@"热门搜索几十块大富科技",@"离开了两款",@"热门",@"热门到点搜索",@"热门啦啦啦啦搜索",@"热门搜索"];
    }
    return _hotSearchShowArray;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self.contentTableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}



@end
