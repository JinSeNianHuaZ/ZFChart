# ZFChart
A simple chart library for iOS , contains barChart, lineChart, pieChart. Thanks for your star if you like.

模仿PNChart写的一个图表库，用法简单，暂时有柱状图，线状图，饼图三种类型，带动画效果，后续可能会更新新的类型，喜欢的欢迎star一个，有任何建议或问题可以加QQ群交流：451169423

###用法:
        第一步(step 1)
        将项目里ZFChart整个文件夹拖进新项目
        
        第二步(step 2)
        #import "ZFChart.h"
        
        第三步(step 3)
        
        
###     ZFGenericChartDataSource数据源方法
####    @required 必须实现的方法
        //返回value数据
        //当只有1组数据时，NSArray存储 @[@"1", @"2", @"3", @"4"]
          当有多组数据时，NSArray存储 @[@[@"123", @"300", @"490", @"380", @"167", @"235"], @[@"256", @"283", @"236", @"240", @"183", @"200"], , @[@"256", @"256", @"256", @"256", @"256", @"256"]] 
        //barChart: 代表有6组，每组有3个item
        //lineChart: 代表有6组，每组有3个item（另一种理解就是有3条线，每条线上有6个点）
        
        - (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart;
        
####     @optional 可选实现的方法
        //返回名称数组(NSArray必须存储NSString类型)
        
        - (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
                return @[@"一年级", @"二年级", @"三年级", @"四年级", @"五年级", @"六年级"];
        }
        
        
        //返回颜色数组(NSArray必须存储UIColor类型, 若不设置，默认随机) 
        //barChart: 若每组有3个item,则返回3个颜色
        //lineChart：若有3条线，则返回3个颜色
        
        - (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
                return @[ZFSkyBlue, ZFOrange, ZFMagenta];
        }
        
        
        //y轴数值显示的上限(若不设置，默认返回数据源最大值)
        
        - (CGFloat)yLineMaxValueInGenericChart:(ZFGenericChart *)chart{
                return 500;
        }
        
        
        //y轴数值显示的段数(若不设置,默认5段)
        
        - (NSInteger)yLineSectionCountInGenericChart:(ZFGenericChart *)chart{
                return 10;
        }
        
        
## BarChart(柱状图)
        须遵循ZFGenericChartDataSource数据源协议

        ZFBarChart * barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT)];
        barChart.dataSource = self;
        barChart.delegate = self;
        barChart.topic = @"xx小学各年级人数";
        barChart.unit = @"人";
        [barChart strokePath];
        [self.view addSubview:barChart];
        
        
###     ZFBarChartDelegate协议方法
####    @optional 可选实现的方法
        //x轴value文本颜色数组(若不设置，则全部返回黑色)
        //返回UIColor或者NSArray(NSArray里必须存储UIColor类型)
        
        - (id)valueTextColorArrayInChart:(ZFGenericChart *)chart;


        //bar宽度(若不设置，默认为25.f)
        
        - (CGFloat)barWidthInBarChart:(ZFBarChart *)barChart;
        
        
        //组与组之间的间距(若不设置,默认为20.f)
        
        - (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart;
        
        
        //每组里面，bar与bar之间的间距(若不设置，默认为5.f)(当只有一组数据时，此方法无效)
        
        - (CGFloat)paddingForBarInBarChart:(ZFBarChart *)barChart;
        
        
效果展示

![](https://github.com/Zirkfied/Library/blob/master/bar1.png)
        
        - (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
                return @[@"123", @"256", @"300", @"283", @"490", @"236"];
        }

![](https://github.com/Zirkfied/Library/blob/master/bar4.png)
        
        - (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
                NSArray * array1 = @[@"123", @"300", @"490", @"380", @"167", @"235"];
                NSArray * array2 = @[@"256", @"283", @"236", @"240", @"183", @"200"];
                NSArray * array3 = @[@"256", @"256", @"256", @"256", @"256", @"256"];
    
                return @[array1, array2, array3];
        }
        
![](https://github.com/Zirkfied/Library/blob/master/bar2.png)
        
        //当只有一组数据时，必须返回UIColor
        - (id)valueTextColorArrayInChart:(ZFGenericChart *)chart{
                return ZFBlue;
        }
        
![](https://github.com/Zirkfied/Library/blob/master/bar4.png)

        //当有多组数据时，若返回UIColor，则所有value颜色一致
        - (id)valueTextColorArrayInChart:(ZFGenericChart *)chart{
                return ZFBlue;
        }
        
![](https://github.com/Zirkfied/Library/blob/master/bar3.png)

        //当有多组数据时，若返回NSarray，效果如上
        - (id)valueTextColorArrayInChart:(ZFGenericChart *)chart{
                return @[ZFColor(71, 204, 255, 1), ZFColor(253, 203, 76, 1), ZFColor(16, 140, 39, 1)];
        }
        
        
        
## LineChart(线状图)
        须遵循ZFGenericChartDataSource数据源协议
        
        ZFLineChart * lineChart = [[ZFLineChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT)];
        lineChart.dataSource = self;
        lineChart.delegate = self;
        lineChart.topic = @"xx小学各年级男女人数";
        lineChart.unit = @"人";
        [lineChart strokePath];
        [self.view addSubview:lineChart];
        
###     ZFLineChartDelegate协议方法
####    @optional 可选实现的方法
        //组宽(若不设置，默认为25.f)
        
        - (CGFloat)groupWidthInLineChart:(ZFLineChart *)lineChart;
        
        
        //组与组之间的间距(若不设置，默认为20.f)
        
        - (CGFloat)paddingForGroupsInLineChart:(ZFLineChart *)lineChart
        
        
        //圆的半径(若不设置，默认为5.f)
        
        - (CGFloat)circleRadiusInLineChart:(ZFLineChart *)lineChart;
        
        
        线宽(若不设置，默认为2.f)
        
        - (CGFloat)lineWidthInLineChart:(ZFLineChart *)lineChart;


效果展示

![](https://github.com/Zirkfied/Library/blob/master/line1.png)

        - (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
                return @[@"123", @"256", @"300", @"283", @"490", @"236"];
        }
        
![](https://github.com/Zirkfied/Library/blob/master/line2.png)

        - (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
                NSArray * array1 = @[@"123", @"300", @"490", @"380", @"167", @"451"];
                NSArray * array2 = @[@"380", @"200", @"326", @"240", @"50", @"137"];
                NSArray * array3 = @[@"256", @"300", @"89", @"430", @"256", @"256"];
    
                return @[array1, array2, array3];
        }
        
## PieChart(饼图)
        须遵循ZFPieChartDataSource数据源方法

        ZFPieChart * pieChart = [[ZFPieChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT)];
        pieChart.dataSource = self;
        pieChart.topic = @"xx小学各年级男女人数占比";
        [pieChart strokePath];
        [self.view addSubview:pieChart];
        
###     ZFPieChartDataSource数据源方法
####    @required 必须实现的方法
        //返回value数据(NSArray必须存储NSString类型)
        
        - (NSArray *)valueArrayInPieChart:(ZFPieChart *)chart;
        
        
        //返回颜色数组(NSArray必须存储UIColor类型)
        
        - (NSArray *)colorArrayInPieChart:(ZFPieChart *)chart;
        
        
####    @optional 可选实现的方法
        //返回名称数据(NSArray必须存储NSString类型)
        
        - (NSArray *)nameArrayInPieChart:(ZFPieChart *)chart
        
        
效果展示

![](https://github.com/Zirkfied/Library/blob/master/pie2.png)
        
###饼图其余属性

![](https://github.com/Zirkfied/Library/blob/master/pie1.png)

        该属性默认为NO，设置YES时，饼图将显示详细信息，如上所示
        pieChart.isShowDetail = YES;
        
![](https://github.com/Zirkfied/Library/blob/master/pie3.png)
        
        该属性默认为YES，设置NO时，饼图将不显示饼图上的百分比，如上所示
        pieChart.isShowPercent = NO;
        
![](https://github.com/Zirkfied/Library/blob/master/pie4.png)
        
        该属性默认为kPercentTypeDecimal(显示2位小数)，当设置kPercentTypeInteger时，将显示四舍五入后的整数，如上所示
        pieChart.percentType = kPercentTypeInteger;
        
![](https://github.com/Zirkfied/Library/blob/master/pie5.png)
        
        该属性默认为kPieChartPatternTypeForCirque(圆环)，当设置kPieChartPatternTypeForCircle时，则以整圆的形式显示，如上所示
        pieChart.piePatternType = kPieChartPatternTypeForCircle;


###其余说明
####    
        1.  ZFGenericChartDataSource是柱状图(BarChart),线状图(LineChart)的数据源方法
            ZFPieChartDataSource是饼图(PieChart)的数据源方法
            根据自身使用的图表遵循对应的数据源
        
        2.  ZFBarChartDelegate是柱状图(BarChart)的部分常量设置的协议方法
            ZFLineChartDelegate是线状图(LineChart)的部分常量设置的协议方法
        
        3.  饼图(PieChart)只有DataSource数据源方法，没有Delegate的协议方法
        
        4.  ZFGenericChartDataSource数据源方法请查看 ZFGenericChart.h
            ZFBarChartDelegate协议方法 和 柱状图(BarChart)其余属性 请查看 ZFBarChart.h
            ZFLineChartDelegate协议方法 和 线状图(LineChart)其余属性 请查看 ZFLineChart.h
            ZFPieChartDataSource 和 饼图(PieChart)其余属性 请查看 ZFPieChart.h
        
        5.其余属性请仔细查看以上4个.h文件的中文注释


###更新日志
        2016.02.25 初版发布
        2016.02.26 新增柱状图和线状图表上的数值显示
        2016.02.29 新增阴影效果，新增线状图Value位置选项
        2016.03.23 添加柱状图,线状图多组数据显示，更改数据源传入模式，用法请参考UITableView，饼图新增整圆模式，
                   若更新，请删除旧版本的文件
        
        
##本人其他开源框架
####[ZFChart - 一款简单好用的图表库，目前有柱状，线状，饼图类型](https://github.com/Zirkfied/ZFChart)
####[ZFScan - 仿微信 二维码/条形码 扫描](https://github.com/Zirkfied/ZFScan)
