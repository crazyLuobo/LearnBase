//
//  ShowListViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/21.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ShowListViewController.h"
#import <UIKit/UIKit.h>
#import "SearchTopView.h"
#import <Masonry.h>
#import "ShowListCollectionViewCell.h"
#import "ShowListLayout.h"
#import "NewsListViewController.h"
#import "NavigationViewController.h"
#import "PDFShowViewController.h"
#import "AnimationTabViewController.h"
#import "ShowAlterViewController.h"
#import "ShowGifImageViewController.h"
#import <TZImagePickerController/TZImagePickerController.h>
#import <RSKImageCropper/RSKImageCropper.h>
#import "TTTAttributeLabelViewController.h"
#import "DCAnimationKitViewController.h"
@interface ShowListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,TZImagePickerControllerDelegate,RSKImageCropViewControllerDelegate,RSKImageCropViewControllerDataSource>
@property (nonatomic, strong)SearchTopView *searchTopView;
@property (nonatomic, strong)UICollectionView *contentCollectionView;

@end

@implementation ShowListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutShowListViewController];
    
    
}

- (void)layoutShowListViewController
{
    [self.view addSubview:self.searchTopView];
    [self.searchTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.left.top.equalTo(self.view);
        make.height.equalTo(@(100));
    }];
    
    [self.view addSubview:self.contentCollectionView];
    [self.contentCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.searchTopView.mas_bottom).offset(0);
        make.left.right.bottom.equalTo(self.view);
        
        
    }];
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


#pragma mark - RSKImageCropViewControllerDelegate
- (void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller
{
    [self.navigationController popViewControllerAnimated:YES];
}

// The original image has been cropped. Additionally provides a rotation angle used to produce image.
- (void)imageCropViewController:(RSKImageCropViewController *)controller
                   didCropImage:(UIImage *)croppedImage
                  usingCropRect:(CGRect)cropRect
                  rotationAngle:(CGFloat)rotationAngle
{
    NSLog(@"%@",croppedImage);
    [self.navigationController popViewControllerAnimated:YES];
}

// The original image will be cropped.
- (void)imageCropViewController:(RSKImageCropViewController *)controller
                  willCropImage:(UIImage *)originalImage
{
    // Use when `applyMaskToCroppedImage` set to YES.
    
}

- (CGRect)imageCropViewControllerCustomMaskRect:(RSKImageCropViewController *)controller

{
    
    //返回图片的位置
    
    return CGRectMake(0, ([UIScreen mainScreen].bounds.size.width-100)/2, [UIScreen mainScreen].bounds.size.width, 100);
    
}

- (UIBezierPath *)imageCropViewControllerCustomMaskPath:(RSKImageCropViewController *)controller

{
    
    //返回裁剪框的位置
    
    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, ([UIScreen mainScreen].bounds.size.width-100)/2, [UIScreen mainScreen].bounds.size.width, 50) cornerRadius:0];
    
    return path;
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShowListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionView" forIndexPath:indexPath];    
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
             [self.navigationController pushViewController:[NavigationViewController new] animated:YES];
//            [self.navigationController pushViewController:[AnimationTabViewController new] animated:YES];
        }
            break;
        case 1:
        {
             [self.navigationController pushViewController:[PDFShowViewController new] animated:YES];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[AnimationTabViewController new] animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[ShowAlterViewController new] animated:YES];
        }
            break;
        case 4:
        {
            [self.navigationController pushViewController:[ShowGifImageViewController new] animated:YES];
        }
            break;
        case 5:
        {
            TZImagePickerController *imagePC = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
            [imagePC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
                NSLog(@"%@",photos);
                
                RSKImageCropViewController *imageCropVC = [[RSKImageCropViewController alloc] initWithImage:photos[0] cropMode:RSKImageCropModeSquare];
                imageCropVC.delegate = self;
                imageCropVC.dataSource = self;
                [self.navigationController pushViewController:imageCropVC animated:YES];
                
            }];
            [self presentViewController:imagePC animated:YES completion:nil];
        }
            break;
        case 6:
        {
            [self.navigationController pushViewController:[TTTAttributeLabelViewController new] animated:YES];
        }
            break;
            case 7:
        {
            [self.navigationController pushViewController:[DCAnimationKitViewController new] animated:YES];
        }
            break;
            
        default:
            break;
    }
   
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchTopView cancleKeyBoard];
}


- (void)setSearchShowStr:(NSString *)searchShowStr
{
    self.searchTopView.searchShowStr = searchShowStr;
}


- (UICollectionView *)contentCollectionView
{
    if (!_contentCollectionView) {
//        CGFloat width = [UIScreen mainScreen].bounds.size.width;
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        CGFloat itemW = (width - 30)/2.0;
//        CGFloat itemH = itemW * 256 / 180;
//        layout.itemSize = CGSizeMake(itemW, itemH);
//        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        layout.minimumLineSpacing = 20;
//        layout.minimumInteritemSpacing = 20;
        ShowListLayout *layout = [[ShowListLayout alloc] init];
        
        _contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _contentCollectionView.backgroundColor = [UIColor whiteColor];
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
        [_contentCollectionView registerClass:[ShowListCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionView"];
    }
    return _contentCollectionView;
}
- (SearchTopView *)searchTopView
{
    if (!_searchTopView) {
        _searchTopView = [[SearchTopView alloc]init];
        __weak ShowListViewController *weakSelf = self;
        _searchTopView.clickReturnBlock = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
        _searchTopView.clickCancleBtnBlock = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
    }
    return _searchTopView;
}

@end
