//
//  NewsListViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/22.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsListHeaderView.h"
#import "NewsListTopSelectView.h"
#import "AllStyleViewController.h"



@interface NewsListViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) NewsListHeaderView *searchTopView;
@property (nonatomic, strong) NewsListTopSelectView *topSelectView;
@property (nonatomic, strong) UIScrollView *backScorllView;
@property (nonatomic, strong) NSArray *showAllTypeArray;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *backLabel;
@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"新的标题";
    [self layoutNewsListViewController];
    self.topSelectView.showTypeArray = self.showAllTypeArray;
    [self setBackScrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}



#pragma mark - UIScrollViewDeletef代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger scrollViewIndex = (NSInteger)scrollView.contentOffset.x/KSCREEN_WIDTH;
    [self.topSelectView setSelectLabelWithIndex:scrollViewIndex];
    [self.topSelectView setSelectLabelScrollWithContentOffset:scrollView.contentOffset.x];

}


#pragma mark - 私有方法
- (void)setBackScrollView
{
    NSLog(@"%f",KSCREEN_WIDTH);
    self.backScorllView.contentSize = CGSizeMake(KSCREEN_WIDTH*self.showAllTypeArray.count, KSCREEN_HEIGHT - 170);
    for (int i = 0; i<self.showAllTypeArray.count; i++) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(KSCREEN_WIDTH *i, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT - 170)];
        [self.backScorllView addSubview:backView];
        backView.backgroundColor = [UIColor whiteColor];
        
        
        if (i == 1) {
            [backView addSubview:self.backLabel];
            [backView addSubview:self.label];
            backView.backgroundColor = [UIColor whiteColor];
            
            UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 100)];
            maskView.backgroundColor = [UIColor redColor];
            self.label.maskView = maskView;
            
            [UIView animateWithDuration:5.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                CGRect frame = maskView.frame;
                frame.origin.x += frame.size.width;
                maskView.frame = frame;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:5.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    CGRect frame = maskView.frame;
                    frame.origin.x -= frame.size.width;
                    maskView.frame = frame;
                } completion:^(BOOL finished) {

                }];
            }];
            
        }

       

    }
    
   
}



#pragma mark - 页面布局
- (void)layoutNewsListViewController
{
    [self.view addSubview:self.searchTopView];
    [self.searchTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@(115));
    }];
    
    [self.view addSubview:self.topSelectView];
    [self.topSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.searchTopView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(55));
    }];
    
    [self.view addSubview:self.backScorllView];

    
}

#pragma mark - getter and setter

- (UIScrollView *)backScorllView
{
    if (!_backScorllView) {
        _backScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 170, KSCREEN_WIDTH, KSCREEN_HEIGHT - 170)];
        _backScorllView.backgroundColor = [UIColor blueColor];
        _backScorllView.pagingEnabled = YES;
        _backScorllView.delegate = self;
    }
    return _backScorllView;
}
- (NewsListHeaderView *)searchTopView
{
    if (!_searchTopView) {
        _searchTopView = [[NewsListHeaderView alloc] init];
    }
    return _searchTopView;
}


- (NewsListTopSelectView *)topSelectView
{
    if (!_topSelectView) {
        _topSelectView = [[NewsListTopSelectView alloc] init];
        __weak NewsListViewController *weakSelf = self;
        _topSelectView.clickSelectViewBlock = ^(NSString * _Nonnull selectString,NSInteger selectIndex) {
            NSLog(@"点击的类型%@",selectString);
            [weakSelf.backScorllView setContentOffset:CGPointMake(KSCREEN_WIDTH*selectIndex, 0) animated:YES];
            
        };
        _topSelectView.clickAllStyleBlock = ^{
            AllStyleViewController *allStyleVc = [[AllStyleViewController alloc] init];
//            UINavigationController *navStyleVc = [[UINavigationController alloc]initWithRootViewController:allStyleVc];
            [weakSelf presentViewController:allStyleVc animated:YES completion:nil];
            
        };
        
    }
    return _topSelectView;
}

- (NSArray *)showAllTypeArray
{
    if (!_showAllTypeArray) {
        _showAllTypeArray = @[@"关注",@"推荐",@"长安",@"精品课",@"热门",@"体育",@"长安",@"精品课",@"热门",@"体育"];
    }
    return _showAllTypeArray;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 300, 100)];
        _label.font = [UIFont boldSystemFontOfSize:20];
        _label.textColor = [UIColor redColor];
        _label.text = @"康师  傅就是  大方  扣水  电费";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UILabel *)backLabel
{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 300, 100)];
        _backLabel.font = [UIFont boldSystemFontOfSize:20];
        _backLabel.textColor = [UIColor blackColor];
        _backLabel.text = @"康师  傅就是  大方  扣水  电费";
        _backLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _backLabel;
}
@end
