//
//  PALabelLayer.m
//  PAChartView
//
//  Created by admin on 16/1/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PALabelLayer.h"
#import <UIKit/UIKit.h>
#import "PATheme.h"

// rect
#define  kWidth           40.0
#define  kHeight          20.0
#define  kOffset          10.0
#define  kCornerRadius    (kHeight / 2)
#define  kFillColor       0xff8888
// text
#define  kFontSize        16
#define  kValueColor      0xffffff

@implementation PALabelLayer

- (instancetype)initWithData:(CGFloat)data location:(CGPoint)location {
    self = [super init];
    if (self) {
        CGFloat x = location.x - (kWidth / 2);
        CGFloat y = location.y - kOffset - kHeight;
        self.frame = CGRectMake(x, y, kWidth, kHeight);
        self.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:kCornerRadius].CGPath;
        self.fillColor = [UIColorFromRGB(kFillColor) CGColor];
        self.masksToBounds = YES;
        
        CATextLayer *textLayer = [CATextLayer layer];
        textLayer.frame = self.bounds;
        textLayer.string = [NSString stringWithFormat:@"%0.2f", data];
        textLayer.fontSize = kFontSize;
        textLayer.foregroundColor = [UIColorFromRGB(kValueColor) CGColor];
        textLayer.alignmentMode = kCAAlignmentCenter;
        
        [self addSublayer:textLayer];
    }
    return self;
}

@end
