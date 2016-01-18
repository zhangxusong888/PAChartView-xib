//
//  GridTest.m
//  MyButton
//
//  Created by xdq on 16/1/4.
//  Copyright © 2016年 com.xdq. All rights reserved.
//

#import "GridTest.h"
#import "PATheme.h"

@interface GridTest()

//private properties
@property (nonatomic,strong) CAShapeLayer *backColor1;
@property (nonatomic,strong) CAShapeLayer *backColor2;
@property (nonatomic,strong) CAShapeLayer *grid;
@property (nonatomic,strong) CAShapeLayer *colorLayer;
@end
    

@implementation GridTest

- (instancetype)initWithHeigh:(CGFloat)height withWidth:(CGFloat)width
{
    self = [super init];
    
    if(self) {
        self.frame = CGRectMake(0, 0, width, height);
        self.backColor1 = [CAShapeLayer layer];
        self.backColor2 = [CAShapeLayer layer];
        self.grid = [CAShapeLayer layer];

        NSInteger xStep = 6;
        NSInteger yStep = 5;
        CGFloat xStepPixel = width / xStep;
        CGFloat yStepPixel = height / yStep;
        CGFloat halfxSteoPixel = xStepPixel / 2;

        CGFloat offsetX = 0;

        self.grid.frame = CGRectMake(0, 0, width, height);

        CGPoint pixelPoint;
        UIBezierPath* gridPath = [UIBezierPath bezierPath];
        UIBezierPath* firstColorPath = [UIBezierPath bezierPath];
        UIBezierPath* secondColorPath = [UIBezierPath bezierPath];

        
        
        for (NSInteger x = 0; x <= xStep; x++)
        {
            pixelPoint.x = offsetX;
            pixelPoint.y = 0;
            
            [gridPath moveToPoint:pixelPoint];
            if(x == xStep)
            {
                [firstColorPath moveToPoint:CGPointMake(pixelPoint.x - halfxSteoPixel, pixelPoint.y)];
                
            }
            else if (x % 2)
            {
                [firstColorPath moveToPoint:CGPointMake(pixelPoint.x - halfxSteoPixel, pixelPoint.y)];
                [secondColorPath moveToPoint:CGPointMake(pixelPoint.x + halfxSteoPixel, pixelPoint.y)];
            }
            
            pixelPoint.y = height;
            
            [gridPath addLineToPoint:pixelPoint];
            
            if(x == xStep)
            {
                [firstColorPath addLineToPoint:CGPointMake(pixelPoint.x - halfxSteoPixel, pixelPoint.y)];
            }
            else if (x % 2)
            {
                [firstColorPath addLineToPoint:CGPointMake(pixelPoint.x - halfxSteoPixel, pixelPoint.y)];
                [secondColorPath addLineToPoint:CGPointMake(pixelPoint.x + halfxSteoPixel, pixelPoint.y)];
            }
            
            offsetX += xStepPixel;
        }
        
        CGFloat offsetY = 0;
        for (NSInteger y = 0; y <= yStep; y++)
        {
            pixelPoint.x = 0;
            pixelPoint.y = offsetY;
            [gridPath moveToPoint:pixelPoint];
            
            pixelPoint.x = width;
            pixelPoint.y = offsetY;
            [gridPath addLineToPoint:pixelPoint];
            
            offsetY += yStepPixel;
        }
        self.backColor1.path = firstColorPath.CGPath;
        self.backColor1.strokeColor = [UIColorFromRGB(0xffa800) CGColor];
        self.backColor1.lineWidth = xStepPixel;
        [self addSublayer:self.backColor1];
        
        self.backColor2.path = secondColorPath.CGPath;
        self.backColor2.strokeColor = [UIColorFromRGB(0xa8ffff) CGColor];
        self.backColor2.lineWidth = xStepPixel;
        [self addSublayer:self.backColor2];
        
        self.grid.path = gridPath.CGPath;
        self.grid.strokeColor =[[UIColor grayColor] CGColor];//UIColorFromRGB(0xff1cff)
        //self.fillColor = [[UIColor yellowColor] CGColor];
        self.grid.lineWidth = 1;
        [self addSublayer:self.grid];
        
    }
    
    return self;
}

@end
