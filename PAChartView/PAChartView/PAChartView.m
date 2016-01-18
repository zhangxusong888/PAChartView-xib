//
//  PAChartView.m
//  PAChartView
//
//  Created by admin on 16/1/12.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAChartView.h"
#import "PAPlotView.h"
#import <Masonry/Masonry.h>

@interface PAChartView ()
// 背景容器
@property (strong, nonatomic) IBOutlet UIView *containerView;
// 绘图容器
@property (weak, nonatomic) IBOutlet PAPlotView *plotView;
// x 轴标签
@property (weak, nonatomic) IBOutlet UILabel *xAxisLabel0;
@property (weak, nonatomic) IBOutlet UILabel *xAxisLabel1;
@property (weak, nonatomic) IBOutlet UILabel *xAxisLabel2;
@property (weak, nonatomic) IBOutlet UILabel *xAxisLabel3;
@property (weak, nonatomic) IBOutlet UILabel *xAxisLabel4;
@property (weak, nonatomic) IBOutlet UILabel *xAxisLabel5;
// y 轴标签
@property (weak, nonatomic) IBOutlet UILabel *yAxisLabel0;
@property (weak, nonatomic) IBOutlet UILabel *yAxisLabel1;
@property (weak, nonatomic) IBOutlet UILabel *yAxisLabel2;
@property (weak, nonatomic) IBOutlet UILabel *yAxisLabel3;
@property (weak, nonatomic) IBOutlet UILabel *yAxisLabel4;
@property (weak, nonatomic) IBOutlet UILabel *yAxisLabel5;
// x 轴 label0 的偏移量
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xAxisLabel0Constraint;
// x 轴 label与label之间 的偏移量
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *xAxisLabelConstraintArray;
// y 轴 label与label之间 的偏移量
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *yAxisLabelConstraintArray;
// 绘图区域和容器的四边空隙
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *plotViewTrailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *plotViewLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *plotViewBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *plotViewTopConstraint;
// x 轴 label 和绘图区域的间隙
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xAxisLabel0ToPlotViewConstraint;
// y 轴 label 和绘图区域的间隙
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yAxisLabel0ToPlotViewConstraint;

@end

@implementation PAChartView

// MARK: Public Interface Functions
- (void)hideAxisLabels {
    // X 轴标签
    self.xAxisLabel0.hidden = YES;
    self.xAxisLabel1.hidden = YES;
    self.xAxisLabel2.hidden = YES;
    self.xAxisLabel3.hidden = YES;
    self.xAxisLabel4.hidden = YES;
    self.xAxisLabel5.hidden = YES;
    // Y 轴标签
    self.yAxisLabel0.hidden = YES;
    self.yAxisLabel1.hidden = YES;
    self.yAxisLabel2.hidden = YES;
    self.yAxisLabel3.hidden = YES;
    self.yAxisLabel4.hidden = YES;
    self.yAxisLabel5.hidden = YES;
    // 绘图视图扩展成和外部容器视图一致
    self.plotViewLeadingConstraint.constant = 0;
    self.plotViewBottomConstraint.constant = 0;
    self.plotViewTopConstraint.constant = 0;
    self.plotViewTrailingConstraint.constant = 0;
    // 变换约束之后，重新布局，更新frame
    [self layoutIfNeeded];
    // frame有变化，需要重绘图层
    [self.plotView reloadAllLayers];
}

- (void)hideGridPlot {
    self.plotView.loadGridLayer = NO;
    [self.plotView reloadAllLayers];
}

// 代码加载函数；推荐使用Xib自动加载的用法，不用调这两个函数
- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self loadViewFromXib];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self loadViewFromXib];
    }
    
    return self;
}

// MARK: UIView Life Cycle Functions
// 通过xib加载自己
- (void)awakeFromNib {
    [self loadViewFromXib];
}

// 自动布局，调整参数，使各个标签和画图的点对正
// 供xib自动调用，执行流程在ViewController的ViewDidload之后
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self adjustXAxisLabelConstraint];
    [self adjustYAxisLabelConstraint];
    
    [self setNeedsDisplay];
}

// MARK: Private Fucntions
- (void)loadViewFromXib {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
    UIView *view = [views firstObject];
    
    if (nil != view) {
        UIView *superview = self;
        
        [superview addSubview:view];
        
        UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superview).with.insets(padding);
        }];
    }
}

- (void)adjustXAxisLabelConstraint {
    // label 0
    NSInteger const xAxisCellNumber = 6;
    CGFloat label0ToPlotViewOffset = self.plotView.bounds.size.width / (xAxisCellNumber * 2);
    self.xAxisLabel0Constraint.constant = label0ToPlotViewOffset;
    
    // other labels
    CGFloat labelToLabelOffset = self.plotView.bounds.size.width / xAxisCellNumber;
    for (NSLayoutConstraint *item in self.xAxisLabelConstraintArray) {
        item.constant = labelToLabelOffset;
    }
    
    // 变换约束之后，重新布局，更新frame
    [self layoutIfNeeded];
}

- (void)adjustYAxisLabelConstraint {
    NSInteger const yAxisCellNumber = 5;
    CGFloat labelToLabelOffset = self.plotView.bounds.size.height / yAxisCellNumber;
    for (NSLayoutConstraint *item in self.yAxisLabelConstraintArray) {
        item.constant = labelToLabelOffset;
    }
    
    // 变换约束之后，重新布局，更新frame
    [self layoutIfNeeded];
}

@end
