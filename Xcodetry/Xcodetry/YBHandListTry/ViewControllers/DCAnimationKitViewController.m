//
//  DCAnimationKitViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/29.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "DCAnimationKitViewController.h"
//#import <UIView+DCAnimationKit.h>
@interface DCAnimationKitViewController ()
@property (nonatomic, strong) UILabel *moveLabel;
@property (nonatomic, strong) UIView *moveView;


@end

@implementation DCAnimationKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =  @"DCAnimationKit";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.moveLabel];
    [self.view addSubview:self.moveView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//        [self.moveView tada:^{
//
//        }];
//        [self.moveLabel tada:^{
//
//        }];
//
    
    //    [self.moveView bounce:^{
    //
    //    }];
    //    [self.moveLabel bounce:^{
    //
    //    }];
    
    //    [self.moveLabel pulse:^{
    //
    //    }];
    //
    //    [self.moveView pulse:^{
    //
    //    }];
    
    //    [self.moveView shake:NULL];
    //    [self.moveLabel shake:NULL];
    //    [self.moveView swing:NULL];
    //    [self.moveLabel swing:NULL];
    
    //    [self.moveLabel snapIntoView:self.view direction:DCAnimationDirectionTop];
    //    [self.moveView snapIntoView:self.view direction:DCAnimationDirectionLeft];
    
    //    [self.moveLabel bounceIntoView:self.view direction:DCAnimationDirectionTop];
    //    [self.moveView bounceIntoView:self.view direction:DCAnimationDirectionLeft];
    
//    [self.moveLabel expandIntoView:self.view finished:NULL];
//    [self.moveView expandIntoView:self.view finished:NULL];
//    [self.moveLabel hinge:NULL];
//    [self.moveView hinge:NULL];
    
//    [self.moveView drop:NULL];
//    [self.moveLabel drop:NULL];
}

#pragma mark - getter and setter
- (UILabel *)moveLabel
{
    if (!_moveLabel) {
        _moveLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 125, 200, 100)];
        _moveLabel.backgroundColor = [UIColor clearColor];
        _moveLabel.text = NSLocalizedString(@"Animate!", nil);
        _moveLabel.font = [UIFont systemFontOfSize:36];
        [_moveLabel sizeToFit];
    }
    return _moveLabel;
}

- (UIView *)moveView
{
    if (!_moveView) {
        _moveView = [[UIView alloc] initWithFrame:CGRectMake(40, 205, 200, 100)];
        _moveView.backgroundColor = [UIColor orangeColor];
    }
    return _moveView;
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
