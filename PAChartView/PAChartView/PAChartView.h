//
//  PAChartView.h
//  PAChartView
//
//  Created by admin on 16/1/12.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAChartView : UIView

- (void)hideAxisLabels;
- (void)hideGridPlot;

// 代码加载函数；推荐使用Xib自动加载的用法，不用调这两个函数
- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;

@end
