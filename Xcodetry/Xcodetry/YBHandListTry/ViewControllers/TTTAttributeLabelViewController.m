//
//  TTTAttributeLabelViewController.m
//  Xcodetry
//
//  Created by iOS002 on 2019/8/29.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "TTTAttributeLabelViewController.h"
#import <TTTAttributedLabel.h>
#import <PNChart.h>
#define ARC4RANDOM_MAX 0x100000000
@interface TTTAttributeLabelViewController ()<PNChartDelegate>
@property (nonatomic) PNLineChart * lineChart;
@property (nonatomic) PNBarChart * barChart;
@property (nonatomic) PNCircleChart * circleChart;
@property (nonatomic) PNPieChart *pieChart;
@property (nonatomic) PNScatterChart *scatterChart;
@property (nonatomic) PNRadarChart *radarChart;
@end

@implementation TTTAttributeLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
    self.title =  @"TTTAttributeLabel";
    self.view.backgroundColor = [UIColor whiteColor];
//    TTTAttributedLabel *attributedLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 100, 200, 20)];
//
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Tom Bombadil" attributes:@{
//                                                            (id)kCTForegroundColorAttributeName : (id)[UIColor redColor].CGColor,
//                                                                                                 NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
//                                                                                                 NSKernAttributeName : [NSNull null],
//                                                                                                 (id)kTTTBackgroundFillColorAttributeName : (id)[UIColor greenColor].CGColor
//                                                                                                 }];
//
//    // The attributed string is directly set, without inheriting any other text
//    // properties of the label.
//    attributedLabel.text = attString;
//
//    [self.view addSubview:attributedLabel];
//
//
//    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 20)];
//    label.font = [UIFont systemFontOfSize:14];
//    label.textColor = [UIColor darkGrayColor];
//    label.lineBreakMode = NSLineBreakByWordWrapping;
//    label.numberOfLines = 0;
//
//    // If you're using a simple `NSString` for your text,
//    // assign to the `text` property last so it can inherit other label properties.
//    NSString *text = @"Lorem ipsum dolor sit amet";
//    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
//        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"ipsum dolor" options:NSCaseInsensitiveSearch];
//        NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"sit amet" options:NSCaseInsensitiveSearch];
//
//        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
//        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
//        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
//        if (font) {
//            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
//            [mutableAttributedString addAttribute:kTTTStrikeOutAttributeName value:@YES range:strikeRange];
//            CFRelease(font);
//        }
//
//        return mutableAttributedString;
//    }];
//
//    [self.view addSubview:label];
//
//    [self addLineView];
//    [self addbarLineView];
//    [self addCircleBar];
//    [self addPieBar];
//    [self addScatter];
    [self addRadar];
}

- (void)addRadar
{
    NSArray *items = @[[PNRadarChartDataItem dataItemWithValue:3 description:@"Art"],
                       [PNRadarChartDataItem dataItemWithValue:2 description:@"Math"],
                       [PNRadarChartDataItem dataItemWithValue:8 description:@"Sports"],
                       [PNRadarChartDataItem dataItemWithValue:5 description:@"Literature"],
                       [PNRadarChartDataItem dataItemWithValue:4 description:@"Other"],
                       ];
    self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 300.0) items:items valueDivider:1];
    
    self.radarChart.plotColor = [UIColor redColor];
    
    [self.radarChart strokeChart];
    
    [self.view addSubview:self.radarChart];
}

- (void)addScatter
{
    self.scatterChart = [[PNScatterChart alloc] initWithFrame:CGRectMake((CGFloat) (SCREEN_WIDTH / 6.0 - 30), 135, 280, 200)];
    //        self.scatterChart.yLabelFormat = @"xxx %1.1f";
    [self.scatterChart setAxisXWithMinimumValue:20 andMaxValue:100 toTicks:6];
    [self.scatterChart setAxisYWithMinimumValue:30 andMaxValue:50 toTicks:5];
    [self.scatterChart setAxisXLabel:@[@"x1", @"x2", @"x3", @"x4", @"x5", @"x6"]];
    [self.scatterChart setAxisYLabel:@[@"y1", @"y2", @"y3", @"y4", @"y5"]];
    
    NSArray *data01Array = [self randomSetOfObjects];
    PNScatterChartData *data01 = [PNScatterChartData new];
    data01.strokeColor = PNGreen;
    data01.fillColor = PNFreshGreen;
    data01.size = 2;
    data01.itemCount = [data01Array[0] count];
    data01.inflexionPointStyle = PNScatterChartPointStyleCircle;
    __block NSMutableArray *XAr1 = [NSMutableArray arrayWithArray:data01Array[0]];
    __block NSMutableArray *YAr1 = [NSMutableArray arrayWithArray:data01Array[1]];
    
    data01.getData = ^(NSUInteger index) {
        CGFloat xValue;
        xValue = [XAr1[index] floatValue];
        CGFloat yValue = [YAr1[index] floatValue];
        return [PNScatterChartDataItem dataItemWithX:xValue AndWithY:yValue];
    };
    
    [self.scatterChart setup];
    self.scatterChart.chartData = @[data01];
    /***
     this is for drawing line to compare
     CGPoint start = CGPointMake(20, 35);
     CGPoint end = CGPointMake(80, 45);
     [self.scatterChart drawLineFromPoint:start ToPoint:end WithLineWith:2 AndWithColor:PNBlack];
     ***/
    self.scatterChart.delegate = self;
    [self.view addSubview:self.scatterChart];
}

- (void)addPieBar
{
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"GOOG I/O"],
                       ];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake((CGFloat) (SCREEN_WIDTH / 2.0 - 100), 135, 200.0, 200.0) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart strokeChart];
    
    
    self.pieChart.legendStyle = PNLegendItemStyleStacked;
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    
    [self.view addSubview:self.pieChart];
}

- (void)addCircleBar
{
    self.circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 150.0, SCREEN_WIDTH, 100.0)
                                                      total:@100
                                                    current:@60
                                                  clockwise:YES];
    
    self.circleChart.backgroundColor = [UIColor whiteColor];
    self.circleChart.chartType = PNChartFormatTypePercent;
    
    [self.circleChart setStrokeColor:[UIColor clearColor]];
    [self.circleChart setStrokeColorGradientStart:[UIColor blueColor]];
    [self.circleChart strokeChart];
    
    [self.view addSubview:self.circleChart];
}
   
- (void)addbarLineView
{
    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter) {
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }
    self.title = @"Bar Chart";
    
    self.barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    //        self.barChart.showLabel = NO;
    self.barChart.yLabelFormatter = ^(CGFloat yValue) {
        return [barChartFormatter stringFromNumber:@(yValue)];
    };
    
    self.barChart.yChartLabelWidth = 20.0;
    self.barChart.chartMarginLeft = 30.0;
    self.barChart.chartMarginRight = 10.0;
    self.barChart.chartMarginTop = 5.0;
    self.barChart.chartMarginBottom = 10.0;
    
    
    self.barChart.labelMarginTop = 5.0;
    self.barChart.showChartBorder = YES;
    [self.barChart setXLabels:@[@"2", @"3", @"4", @"5", @"2", @"3", @"4", @"5"]];
    //       self.barChart.yLabels = @[@-10,@0,@10];
    //        [self.barChart setYValues:@[@10000.0,@30000.0,@10000.0,@100000.0,@500000.0,@1000000.0,@1150000.0,@2150000.0]];
    [self.barChart setYValues:@[@10.82, @1.88, @6.96, @33.93, @10.82, @1.88, @6.96, @33.93]];
    [self.barChart setStrokeColors:@[PNGreen, PNGreen, PNRed, PNBlue, PNGreen, PNGreen, PNRed, PNGreen]];
    self.barChart.isGradientShow = NO;
    self.barChart.isShowNumbers = NO;
    
    [self.barChart strokeChart];
    
    self.barChart.delegate = self;
    
    [self.view addSubview:self.barChart];
}

-(void)addLineView
{
   
    
    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    self.lineChart.backgroundColor = [UIColor whiteColor];
    self.lineChart.yGridLinesColor = [UIColor grayColor];
    [self.lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL *stop) {
        obj.pointLabelColor = [UIColor blueColor];
    }];
    self.lineChart.showCoordinateAxis = YES;
    self.lineChart.yLabelFormat = @"%1.1f";
    self.lineChart.xLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:8.0];
    //        [self.lineChart setXLabels:@[@"SEP 1", @"SEP 2", @"SEP 3", @"SEP 4", @"SEP 5", @"SEP 6", @"SEP 7"]];
    [self.lineChart setXLabels:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11"]];
    self.lineChart.yLabelColor = [UIColor blueColor];
    self.lineChart.xLabelColor = [UIColor redColor];
    
    // added an example to show how yGridLines can be enabled
    // the color is set to clearColor so that the demo remains the same
    self.lineChart.showGenYLabels = NO;
    self.lineChart.showYGridLines = YES;
    
    //Use yFixedValueMax and yFixedValueMin to Fix the Max and Min Y Value
    //Only if you needed
    self.lineChart.yFixedValueMax = 200;
    self.lineChart.yFixedValueMin = 0.0;
    
    [self.lineChart setYLabels:@[
                                 @"0",
                                 @"50",
                                 @"100",
                                 @"150",
                                 @"200",
                                 @"250",
                                 @"300",
                                 ]
     ];
    
    // Line Chart #1
    NSArray *data01Array = @[@124, @134, @128, @127, @144, @139, @134, @134, @132, @130, @116, @95];
    PNLineChartData *data01 = [PNLineChartData new];
    
    //    data01.rangeColors = @[
    //                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(1, 54) color:[UIColor redColor]],
    //                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(55, 6) color:[UIColor yellowColor]],
    //                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(61, 49) color:[UIColor greenColor]],
    //                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(110, 20) color:[UIColor yellowColor]],
    //                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(130, 470) color:[UIColor redColor]]
    //                           ];
    data01.dataTitle = @"Alpha";
    data01.color = PNFreshGreen;
    data01.pointLabelColor = [UIColor blackColor];
    data01.alpha = 0.3f;
    data01.showPointLabel = YES;
    data01.pointLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:9.0];
    data01.itemCount = data01Array.count;
    data01.inflexionPointColor = PNRed;
    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    // Line Chart #2
    NSArray *data02Array = @[@0.0, @18.1, @26.4, @30.2, @12.2, @16.2, @27.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"Beta";
    data02.pointLabelColor = [UIColor blackColor];
    data02.color = PNTwitterColor;
    data02.alpha = 0.5f;
    data02.itemCount = data02Array.count;
    data02.inflexionPointStyle = PNLineChartPointStyleCircle;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    self.lineChart.chartData = @[data01, data02];
    [self.lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL *stop) {
        obj.pointLabelColor = [UIColor blackColor];
    }];
    
    
    [self.lineChart strokeChart];
    self.lineChart.delegate = self;
    
    
    [self.view addSubview:self.lineChart];
    
    self.lineChart.legendStyle = PNLegendItemStyleStacked;
    self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    self.lineChart.legendFontColor = [UIColor redColor];
    
    UIView *legend = [self.lineChart getLegendWithMaxWidth:320];
    [legend setFrame:CGRectMake(30, 340, legend.frame.size.width, legend.frame.size.width)];
    [self.view addSubview:legend];
}

- (NSArray *)randomSetOfObjects {
    NSMutableArray *array = [NSMutableArray array];
    NSString *LabelFormat = @"%1.f";
    NSMutableArray *XAr = [NSMutableArray array];
    NSMutableArray *YAr = [NSMutableArray array];
    for (int i = 0; i < 25; i++) {
        [XAr addObject:[NSString stringWithFormat:LabelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisX_maxValue - self.scatterChart.AxisX_minValue) + self.scatterChart.AxisX_minValue)]];
        [YAr addObject:[NSString stringWithFormat:LabelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisY_maxValue - self.scatterChart.AxisY_minValue) + self.scatterChart.AxisY_minValue)]];
    }
    [array addObject:XAr];
    [array addObject:YAr];
    return array;
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
