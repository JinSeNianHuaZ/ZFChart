//
//  SingleLineChartViewController.m
//  ZFChartView
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SingleLineChartViewController.h"
#import "ZFChart.h"

@interface SingleLineChartViewController()<ZFGenericChartDataSource, ZFLineChartDelegate>

@end

@implementation SingleLineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZFLineChart * lineChart = [[ZFLineChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT)];
    lineChart.dataSource = self;
    lineChart.delegate = self;
    lineChart.topic = @"xx小学各年级男女人数";
    lineChart.unit = @"人";
    lineChart.topicColor = ZFPurple;
//    lineChart.backgroundColor = ZFGreen;
    [self.view addSubview:lineChart];
    [lineChart strokePath];
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"123", @"256", @"300", @"283", @"490", @"236"];
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"一年级", @"二年级", @"三年级", @"四年级", @"五年级", @"六年级"];
}

- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFMagenta];
}

- (CGFloat)yLineMaxValueInGenericChart:(ZFGenericChart *)chart{
    return 500;
}

- (NSInteger)yLineSectionCountInGenericChart:(ZFGenericChart *)chart{
    return 10;
}

#pragma mark - ZFLineChartDelegate

//- (CGFloat)groupWidthInLineChart:(ZFLineChart *)lineChart{
//    return 25.f;
//}
//
//- (CGFloat)paddingForGroupsInLineChart:(ZFLineChart *)lineChart{
//    return 20.f;
//}
//
//- (CGFloat)circleRadiusInLineChart:(ZFLineChart *)lineChart{
//    return 5.f;
//}
//
//- (CGFloat)lineWidthInLineChart:(ZFLineChart *)lineChart{
//    return 2.f;
//}

@end
