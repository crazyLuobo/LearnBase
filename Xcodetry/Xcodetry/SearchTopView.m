//
//  SearchTopView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "SearchTopView.h"
#import <Masonry.h>
@interface SearchTopView()<UITextFieldDelegate>
@property (nonatomic, strong)UIImageView *leftBackImageView;
@property (nonatomic, strong)UIButton *rightCancleBtn;
@property (nonatomic, strong)UITextField *searchTextField;
@property (nonatomic, strong)UIView *searchBackView;
@property (nonatomic, strong)UIImageView *searchIconImageView;




@end
@implementation SearchTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutSearchTopView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)layoutSearchTopView
{

    [self addSubview:self.leftBackImageView];
    [self.leftBackImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.centerY.mas_equalTo(self.mas_centerY).offset(15);
        make.width.equalTo(@(15));
        make.height.equalTo(@(40));
    
    }];
    
    [self addSubview:self.rightCancleBtn];
    [self.rightCancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.mas_centerY).offset(15);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
    
    [self addSubview:self.searchBackView];
    [self.searchBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftBackImageView.mas_right).offset(5);
        make.centerY.mas_equalTo(self.rightCancleBtn.mas_centerY);
        make.right.mas_equalTo(self.rightCancleBtn.mas_left).offset(-15);
        make.height.equalTo(@(30));
    
    }];
    
    [self.searchBackView addSubview:self.searchIconImageView];
    [self.searchIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.searchBackView.mas_left).offset(15);
        make.centerY.mas_equalTo(self.searchBackView.mas_centerY);
        make.width.equalTo(@(15));
        make.height.equalTo(@(20));
    }];
    
    [self.searchBackView addSubview:self.searchTextField];
    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.searchIconImageView.mas_right).offset(5);
        make.centerY.mas_equalTo(self.searchBackView.mas_centerY);
        make.right.mas_equalTo(self.searchBackView.mas_right).offset(-15);
        make.height.equalTo(@(28));
    }];
    
    
}

- (void)clickLeftBtn
{
    if (self.clickReturnBlock) {
        self.clickReturnBlock();
    }
}

- (void)cliclkRightCancleBtn
{
    if (self.clickCancleBtnBlock) {
        self.clickCancleBtnBlock();
    }
    
}

- (void)setSearchShowStr:(NSString *)searchShowStr
{
    _searchShowStr = searchShowStr;
    self.searchTextField.text = searchShowStr;
}

- (void)cancleKeyBoard
{
    [self.searchTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"returns%@",textField.text);
    NSArray *contentArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"History"];
    NSMutableArray *historyArray;
    if (contentArray) {
        historyArray = [NSMutableArray arrayWithArray:contentArray];
    }else{
        historyArray = [NSMutableArray array];
    }
    if (![historyArray containsObject:textField.text]) {
        [historyArray insertObject:textField.text atIndex:0];
        [[NSUserDefaults standardUserDefaults] setObject:historyArray forKey:@"History"];
        [[NSUserDefaults  standardUserDefaults] synchronize];
    }
    
    if (self.inputNewSearchKeyBlock) {
        self.inputNewSearchKeyBlock(textField.text);
    }
   
    return YES;
}

- (UIButton *)rightCancleBtn
{
    if (!_rightCancleBtn) {
        _rightCancleBtn = [UIButton new];
        [_rightCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_rightCancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        _rightCancleBtn.backgroundColor = [UIColor redColor];
        [_rightCancleBtn addTarget:self action:@selector(cliclkRightCancleBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightCancleBtn;
}

- (UIImageView *)leftBackImageView
{
    if (!_leftBackImageView) {
        _leftBackImageView = [[UIImageView alloc] init];
        _leftBackImageView.image = [UIImage imageNamed:@"return"];
        _leftBackImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLeftBtn)];
        [_leftBackImageView addGestureRecognizer:tap];
       
    }
    return _leftBackImageView;
}

- (UIView *)searchBackView
{
    if (!_searchBackView) {
        _searchBackView = [[UIView alloc]init];
        _searchBackView.layer.borderColor = [UIColor blackColor].CGColor;
        _searchBackView.layer.cornerRadius = 15;
        _searchBackView.layer.borderWidth = 0.5;
    }
    return _searchBackView;
}

- (UIImageView *)searchIconImageView
{
    if (!_searchIconImageView) {
        _searchIconImageView = [[UIImageView alloc] init];
        _searchIconImageView.image = [UIImage imageNamed:@"return"];
    }
    return _searchIconImageView;
}

- (UITextField *)searchTextField
{
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] init];
        _searchTextField.text = @"短袖男";
        _searchTextField.textColor = [UIColor blackColor];
        _searchTextField.font = [UIFont systemFontOfSize:15];
        _searchTextField.delegate = self;
        _searchTextField.returnKeyType = UIReturnKeySearch;
    
    }
    return _searchTextField;
}

@end
