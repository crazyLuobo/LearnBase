
//
//  PDFShowViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/28.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "PDFShowViewController.h"
#import <PDFKit/PDFKit.h>
@interface PDFShowViewController ()

@end

@implementation PDFShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PDFKit学习";
    NSString *pdfPath = [[NSBundle mainBundle] pathForResource:@"swift4" ofType:@"pdf"];
    NSURL *pdfUrl = [NSURL fileURLWithPath:pdfPath];
    if (@available(iOS 11.0, *)) {
        PDFDocument *document = [[PDFDocument alloc] initWithURL:pdfUrl];
        PDFView *pdfView = [[PDFView alloc] initWithFrame:self.view.bounds];
        pdfView.document = document;
        pdfView.autoScales = YES;
        pdfView.userInteractionEnabled = YES;
    
        
        
        UIView *labelView = [[PDFKitPlatformView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        labelView.backgroundColor = [UIColor blueColor];
        [pdfView addSubview:labelView];
        [self.view addSubview:pdfView];
    } else {
        // Fallback on earlier versions
    }
    
   
    

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
