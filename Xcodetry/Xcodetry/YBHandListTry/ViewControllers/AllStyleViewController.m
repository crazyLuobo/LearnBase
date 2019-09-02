//
//  AllStyleViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/22.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "AllStyleViewController.h"
#import "GuideBottomView.h"
#import "GuideBottomShowView.h"
#import "GuideShowView.h"
#import "YBHandListViewController.h"
@interface AllStyleViewController ()
@property (nonatomic, strong) GuideBottomView *bottomView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) GuideBottomShowView *bottomLineView;
@property (nonatomic, strong) GuideShowView *guideShowView;

@end

@implementation AllStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.index = 0;
//
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 10)];
//    lineView.backgroundColor = [UIColor grayColor];
//    lineView.layer.masksToBounds = YES;
//    lineView.layer.cornerRadius = 5;
//    [self.view addSubview:lineView];
//    [lineView addSubview:self.bottomView];
//    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.height.equalTo(lineView);
//    }];
//
//    self.index = 0;
//
//    [self.view addSubview:self.bottomLineView];
//    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.bottomView.mas_top).offset(60);
//        make.left.mas_equalTo(self.view.mas_left).offset(100);
//        make.right.mas_equalTo(self.view.mas_right).offset(-100);
//        make.height.equalTo(@(10));
//    }];
    
//    [self.view addSubview:self.guideShowView];
//    [self.guideShowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.bottom.equalTo(self.view);
//    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


#pragma mark - 私有方法
- (void)clickViewAction
{
    YBHandListViewController *listVc = [[YBHandListViewController alloc] init];
    [self presentViewController:listVc animated:YES completion:^{
        
    }];
}


#pragma mark - getter and setter
- (GuideShowView *)guideShowView
{
    if (!_guideShowView) {
        _guideShowView = [[GuideShowView alloc]init];
        _guideShowView.showScrollViewArray = @[[self returnShowScorView],[self returnShowScorView],[self returnShowScorView]];
        _guideShowView.showBottomColorArray = @[[UIColor greenColor],[UIColor blueColor],[UIColor yellowColor]];
    }
    return _guideShowView;
}


- (UIView *)returnShowScorView
{
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    UIView *showView = [[UIView alloc] init];
    showView.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickViewAction)];
    [showView addGestureRecognizer:tap];
    return showView;
    
    
}



- (GuideBottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[GuideBottomView alloc] init];
        _bottomView.showColorArray = @[[UIColor greenColor],[UIColor blueColor],[UIColor yellowColor],[UIColor redColor]];
    }
    return _bottomView;
}

- (GuideBottomShowView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[GuideBottomShowView alloc] init];
        _bottomLineView.showDiffColorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor],[UIColor redColor]];
        _bottomLineView.duration = 5;
    }
    return _bottomLineView;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.index += 1;
    [self.bottomView setScrollToIndex:self.index];
    
//    [self.bottomLineView setBottomShowIndex:self.index];
    [self.bottomLineView setBottomShowBaseWidthProportion:0.5];
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
