//
//  AnimationTabViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/28.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "AnimationTabViewController.h"
#import <TLAnimationTabBar.h>

@interface AnimationTabViewController ()

@end

@implementation AnimationTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"tabbar动画";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:childViewController(@"Pin", @"icon_pin_00160", 0)];
    [self addChildViewController:childViewController(@"User", @"user_00084", 1)];
    [self addChildViewController:childViewController2(UITabBarSystemItemBookmarks, 2)];
    [self addChildViewController:childViewController(@"Drop", @"drop", 3)];
    [self addChildViewController:childViewController(@"Tools", @"Tools_00028", 4)];
    
    self.tabBar.tintColor = [UIColor blueColor];
    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = [UIColor colorWithRed:124/255.0 green:99/255.0 blue:86/255.0 alpha:1];
    } else {
        // Fallback on earlier versions
    }
}




UIViewController *childViewController (NSString *title,NSString *imgName,NSInteger tag)
{
    
    UIViewController *VC = [[UIViewController alloc] init];
    VC.view.backgroundColor = [UIColor whiteColor];
    VC.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imgName] tag:tag];
    VC.navigationItem.title = @"控制器哈哈哈";
    setAnimation(VC.tabBarItem, tag);
    
    return VC;
}

UIViewController *childViewController2 (UITabBarSystemItem systemItem, NSUInteger tag) {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    vc.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:systemItem tag:tag];
    
    setAnimation(vc.tabBarItem, tag);
    
    return vc;
}

void setAnimation(UITabBarItem *item,NSInteger index)
{
    item.animation = @[
                       bounceAnimation(), rotationAnimation(), transitionAniamtion(),
                       fumeAnimation(), frameAnimation()
                       ][index];
}

TLBounceAnimation *bounceAnimation(){
    TLBounceAnimation *anm = [TLBounceAnimation new];
    return anm;
}

TLRotationAnimation *rotationAnimation(){
    TLRotationAnimation *anm = [TLRotationAnimation new];
    return anm;
}

TLTransitionAniamtion *transitionAniamtion(){
    TLTransitionAniamtion *anm = [TLTransitionAniamtion new];
    anm.direction = 1; // 1~6
    anm.disableDeselectAnimation = NO;
    return anm;
}

TLFumeAnimation *fumeAnimation(){
    TLFumeAnimation *anm = [TLFumeAnimation new];
    return anm;
}

TLFrameAnimation *frameAnimation(){
    TLFrameAnimation *anm = [TLFrameAnimation new];
    anm.images = imgs();
    return anm;
}

NSArray *imgs (){
    NSMutableArray *temp = [NSMutableArray array];
    for (NSInteger i = 28 ; i <= 65; i++) {
        NSString *imgName = [NSString stringWithFormat:@"Tools_000%zi", i];
        CGImageRef img = [UIImage imageNamed:imgName].CGImage;
        [temp addObject:(__bridge id _Nonnull)(img)];
    }
    return temp;
}


@end
