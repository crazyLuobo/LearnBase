//
//  ShowAlterViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/29.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ShowAlterViewController.h"
#import <SXAlertView.h>

@interface ShowAlterViewController ()<SXAlertViewDelegate>
@property (nonatomic, strong) UIButton *clickShowAlterBtn;

@end

@implementation ShowAlterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AlterView展示";
    
  
    [self.view addSubview:self.clickShowAlterBtn];
    
}

- (void)clickNone:(UIButton *)sender {
    SXAlertView *alertView = [[SXAlertView alloc]initWithTitle:@"用户调研" message:@"当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.animationOption = SXAlertAnimationOptionNone;
    [alertView show];
}

- (void)clickZoom:(UIButton *)sender {
    SXAlertView *alertView = [[SXAlertView alloc]initWithTitle:@"用户调研" message:@"当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.animationOption = SXAlertAnimationOptionZoom;
    [alertView show];
}

- (void)clickTop:(UIButton *)sender {
    SXAlertView *alertView = [[SXAlertView alloc]initWithTitle:@"用户调研" message:@"当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.animationOption = SXAlertAnimationOptionTopToCenter;
    [alertView show];
}

- (void)clickButton:(UIButton *)sender {
    SXAlertView *alertView = [[SXAlertView alloc]initWithTitle:@"用户调研" message:@"当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"button1", @"button2", @"button3", @"button4", @"button5", nil];
    alertView.animationOption = SXAlertAnimationOptionTopToCenter;
    [alertView show];
}
- (void)clickText:(UIButton *)sender {
    [SXAlertView showWithTitle:@"用户调研" message:@"当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。\n当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。\n当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" clickButtonBlock:^(SXAlertView * _Nonnull alertView, NSInteger buttonIndex) {
        NSLog(@"%s %zd", __FUNCTION__, buttonIndex);
    }];
    
}
- (void)clickTextField:(UIButton *)sender {
    [SXAlertView showWithTitle:@"用户调研" placeholder:@"请输入内容" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" clickButtonBlock:^(SXAlertView * _Nonnull alertView, NSInteger buttonIndex, NSString * _Nonnull text) {
        NSLog(@"%s %zd %@", __FUNCTION__, buttonIndex, text);
//        self.textResult.text = text;
    }];
}

- (void)clickTextView:(UIButton *)sender {
    [SXAlertView showTextViewWithTitle:@"用户调研" placeholder:@"请输入内容" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" clickButtonBlock:^(SXAlertView * _Nonnull alertView, NSInteger buttonIndex, NSString * _Nonnull text) {
        NSLog(@"%s %zd %@", __FUNCTION__, buttonIndex, text);
//        self.textResult.text = text;
    }];
}
- (void)clickVisual:(UIButton *)sender {
    SXAlertView *alertView = [[SXAlertView alloc]initWithTitle:@"用户调研" message:@"当客户拜访及业务轮岗形成良好的机制，同时产品发展到一定规模后，用户调研问卷就成为更加高效的获取用户声音的重要手段了。不同于C端产品，B端产品的调研问卷内容应该更加详细，更加坦诚的询问产品功能与用户的使用体验。定期的进行客户问卷调研，能够建立良好、有效的客户沟通机制，加深产品与客户之间的相互理解。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.animationOption = SXAlertAnimationOptionTopToCenter;
    alertView.visual = YES;
    [alertView show];
}

- (void)clickWLessH:(UIButton *)sender {
    [SXAlertView showWithTitle:@"发送图片给：哈哈哈" image:[UIImage imageNamed:@"pic1"] cancelButtonTitle:@"取消" otherButtonTitle:@"确定" clickButtonBlock:^(SXAlertView * _Nonnull alertView, NSInteger buttonIndex) {
        NSLog(@"%s %zd", __FUNCTION__, buttonIndex);
    }];
    
}
- (void)clickWEqualH:(UIButton *)sender {
    [SXAlertView showWithTitle:@"发送图片给：哈哈哈" image:[UIImage imageNamed:@"pic3"] cancelButtonTitle:@"取消" otherButtonTitle:@"确定" clickButtonBlock:^(SXAlertView * _Nonnull alertView, NSInteger buttonIndex) {
        NSLog(@"%s %zd", __FUNCTION__, buttonIndex);
    }];
    
}
- (void)clickWGreaterH:(UIButton *)sender {
    [SXAlertView showWithTitle:@"发送图片给：哈哈哈" image:[UIImage imageNamed:@"pic2"] cancelButtonTitle:@"取消" otherButtonTitle:@"确定" clickButtonBlock:^(SXAlertView * _Nonnull alertView, NSInteger buttonIndex) {
        NSLog(@"%s %zd", __FUNCTION__, buttonIndex);
    }];
    
}


- (void)alertView:(SXAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%s %zd", __FUNCTION__, buttonIndex);
}


#pragma mark - 私有方法
- (void)clickShowAlterBtnAction:(UIButton *)sender
{
//    [self clickZoom:sender];
//    [self clickTop:sender];
//    [self clickText:sender];
//    [self clickTextField:sender];
    [self clickTextView:sender];
}



#pragma mark - getter and setter
- (UIButton *)clickShowAlterBtn
{
    if (!_clickShowAlterBtn) {
        _clickShowAlterBtn = [[UIButton alloc] init];
        _clickShowAlterBtn.frame = CGRectMake(100, 300, 100, 50);
        _clickShowAlterBtn.backgroundColor = [UIColor blueColor];
        [_clickShowAlterBtn setTitle:@"点这里" forState:UIControlStateNormal];
        [_clickShowAlterBtn addTarget:self action:@selector(clickShowAlterBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickShowAlterBtn;
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
