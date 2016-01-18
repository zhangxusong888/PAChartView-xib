//
//  PAPlotView.h
//  PAChartView
//
//  Created by admin on 16/1/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPlotType.h"

@interface PAPlotView : UIView
// 显示或者隐藏底部的格子背景
@property (assign, nonatomic) BOOL loadGridLayer;
// 显示渐变的折线
@property (assign, nonatomic) CGFloat min;
@property (assign, nonatomic) CGFloat max;
@property (strong, nonatomic) NSArray *datas;
// 图表类型
@property (assign, nonatomic) PAPlotType type;

// 刷新图层
- (void)reloadAllLayers;

@end
