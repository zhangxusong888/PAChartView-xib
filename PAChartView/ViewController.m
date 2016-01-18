//
//  ViewController.m
//  PAChartView
//
//  Created by admin on 16/1/12.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "PAChartView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PAChartView *chartView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.chartView hideAxisLabels];
//    [self.chartView hideGridPlot];
}

- (IBAction)buttonTouched:(UIButton *)sender {
    [self.chartView hideGridPlot];
}

- (IBAction)testButton2Touched:(UIButton *)sender {
    [self.chartView hideAxisLabels];
}

@end
