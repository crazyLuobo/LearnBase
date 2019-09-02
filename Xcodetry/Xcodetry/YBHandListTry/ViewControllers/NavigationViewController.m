//
//  NavigationViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/28.
//  Copyright © 2019 iOS002. All rights reserved.
//  用于向上滑消失导航栏的三种方式

#import "NavigationViewController.h"

@interface NavigationViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *backScrollView;

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationController.hidesBarsOnSwipe = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"滑动消失";
    [self.view addSubview:self.backScrollView];
    
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

//#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
//    CGFloat velcoty = [pan velocityInView:scrollView].y;
//    if (velcoty < 5 && velcoty != 0) {
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//    }else if(velcoty > 5) {
//         [self.navigationController setNavigationBarHidden:NO animated:YES];
//    }else{
//
//    }
//}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (velocity.y > 0.0) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else if (velocity.y < 0.0)
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}



#pragma mark - getter and setter
- (UIScrollView *)backScrollView
{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 84)];
        _backScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 1000);
        _backScrollView.delegate = self;
    }
    return _backScrollView;
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
