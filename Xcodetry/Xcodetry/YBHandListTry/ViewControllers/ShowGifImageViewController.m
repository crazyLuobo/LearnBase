//
//  ShowGifImageViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/29.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ShowGifImageViewController.h"
#import <YLImageView.h>
#import <YLGIFImage.h>
@interface ShowGifImageViewController ()

@end

@implementation ShowGifImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"GIF展示";
    YLImageView* imageView = [[YLImageView alloc] initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:imageView];
    imageView.image = [YLGIFImage imageNamed:@"背景.gif"];
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
