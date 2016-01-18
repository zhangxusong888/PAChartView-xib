//
//  PAPlotView.m
//  PAChartView
//
//  Created by admin on 16/1/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAPlotView.h"
#import "PAGridLayer.h"
#import "PAPathLayer.h"
#import "PAMarkLayer.h"

@interface PAPlotView ()

@property (strong, nonatomic) PAGridLayer *gridLayer;
@property (strong, nonatomic) PAPathLayer *pathLayer;
@property (strong, nonatomic) PAMarkLayer *markLayer;

@end

@implementation PAPlotView

// MARK: Public Interface Functions
- (void)reloadAllLayers {
    [self removeAllLayers];
    [self loadAllLayers];
}

// MARK: UIView Life Cycle Functions
- (void)awakeFromNib {
    // 这个比ViewController的ViewDidload更早执行，设置一些默认值
    self.loadGridLayer = YES;
    self.min = 4.6;
    self.max = 5.6;
    self.datas = @[@4.6, @4.8, @4.7, @5.0, @5.5, @5.3];
    self.type = PAPlotTypePointsAndLabels;
}
// 供xib自动调用，执行流程在ViewController的ViewDidload之后
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // Drawing code
    
    [self loadAllLayers];

    [self setNeedsDisplay];
 }

// MARK: Private Fucntions
- (void)loadAllLayers {
    [self loadPAGridLayer];
    [self loadPAPathLayer];
    [self loadPAMarkLayer];
}

- (void)removeAllLayers {
    [self removePAGridLayer];
    [self removePAPathLayer];
    [self removePAMarkLayer];
}

// grid layer
- (void)loadPAGridLayer {
    if (!self.loadGridLayer) {
        return;
    }
    if (nil == self.gridLayer) {
        // 这里要取frame，所以先更新一下autolayout，防止数据是旧的
        [self layoutIfNeeded];
        self.gridLayer = [[PAGridLayer alloc] initWithFrame:self.bounds];
        [self.layer addSublayer:self.gridLayer];
    }    
}

- (void)removePAGridLayer {
    if (nil != self.gridLayer) {
        [self.gridLayer removeFromSuperlayer];
        self.gridLayer = nil;
    }
}

// path layer
- (void)loadPAPathLayer {
    if (nil == self.pathLayer) {
        // 这里要取frame，所以先更新一下autolayout，防止数据是旧的
        [self layoutIfNeeded];
        NSArray *xValues = [self generateXAxisArray];
        NSArray *yValues = [self generateYAxisArray];
        self.pathLayer = [[PAPathLayer alloc] initWithFrame:self.bounds xAxisArray:xValues yAxisArray:yValues];
        [self.layer addSublayer:self.pathLayer];
    }
}

- (void)removePAPathLayer {
    if (nil != self.pathLayer) {
        [self.pathLayer removeFromSuperlayer];
        self.pathLayer = nil;
    }
}

// mark layer
- (void)loadPAMarkLayer {
    if (nil == self.markLayer) {
        // 这里要取frame，所以先更新一下autolayout，防止数据是旧的
        [self layoutIfNeeded];
        NSArray *xValues = [self generateXAxisArray];
        NSArray *yValues = [self generateYAxisArray];
        self.markLayer = [[PAMarkLayer alloc] initWithFrame:self.bounds xAxisArray:xValues yAxisArray:yValues actrualDatas:self.datas chartType:self.type];
        [self.layer addSublayer:self.markLayer];
    }
}

- (void)removePAMarkLayer {
    if (nil != self.markLayer) {
        [self.markLayer removeFromSuperlayer];
        self.markLayer = nil;
    }
}

// 转换数据为layer的坐标
- (NSArray *)generateXAxisArray {
    NSMutableArray *xAxisArray = [NSMutableArray array];
    CGFloat step = self.frame.size.width / self.datas.count;
    CGFloat halfStep = step / 2;
    
    for (NSInteger i = 0; i < self.datas.count; i++) {
        CGFloat value = halfStep + (step * i);
        xAxisArray[i] = [NSNumber numberWithFloat:value];
    }
    
    return [NSArray arrayWithArray:xAxisArray];
}

- (NSArray *)generateYAxisArray {
    NSMutableArray *yAxisArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.datas.count; i++) {
        CGFloat value = ((self.max - [self.datas[i] floatValue]) / (self.max - self.min)) * self.frame.size.height ;
        yAxisArray[i] = [NSNumber numberWithFloat:value];
    }
    
    return [NSArray arrayWithArray:yAxisArray];
}

@end
