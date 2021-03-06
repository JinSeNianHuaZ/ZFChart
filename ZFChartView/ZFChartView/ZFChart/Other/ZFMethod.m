//
//  ZFMethod.m
//  ZFChartView
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZFMethod.h"
#import "ZFConst.h"

static ZFMethod * instance = nil;

@interface ZFMethod()
/** 记录当前遍历中yLine显示最大值 */
@property (nonatomic, assign) CGFloat tempYLineMaxValue;

@end

@implementation ZFMethod

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    instance.tempYLineMaxValue = 0;
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [ZFMethod shareInstance];
}

+ (instancetype)copyWithZone:(struct _NSZone *)zone{
    return [ZFMethod shareInstance];
}

/**
 *  计算颜色数量
 */
- (NSInteger)countColorCount:(NSArray *)array{
    id subOject = array.firstObject;
    if ([subOject isKindOfClass:[NSArray class]]){
        return array.count;
    }
    return 1;
}

/**
 *  存储随机颜色
 */
- (NSMutableArray *)cachedColor:(NSArray *)array{
    NSInteger count = [self countColorCount:array];
    NSMutableArray * newArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        [newArray addObject:ZFRandomColor];
    }
    return newArray;
}

/**
 *  获取数据源最大值，并赋值给y轴最大上限
 */
- (CGFloat)cachedYLineMaxValue:(NSMutableArray *)array{
    if (array.count > 0) {
        for (id subObject in array) {
            if ([subObject isKindOfClass:[NSString class]]) {
                CGFloat value = [subObject floatValue];
                if (value > _tempYLineMaxValue) {
                    _tempYLineMaxValue = value;
                }
                
            }else if([subObject isKindOfClass:[NSArray class]]){
                [self cachedYLineMaxValue:subObject];
            }
        }
        return _tempYLineMaxValue;
    }
    return 0;
}

@end
