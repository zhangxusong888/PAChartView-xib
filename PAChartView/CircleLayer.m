//
//  CircleLayer.m
//  MyButton
//
//  Created by xdq on 16/1/14.
//  Copyright © 2016年 com.xdq. All rights reserved.
//

#import "CircleLayer.h"

@interface CircleLayer()
@property (strong, nonatomic) CAShapeLayer *laberLayer;
@property (strong, nonatomic) CAShapeLayer *pointLayer;
@property (strong, nonatomic) CATextLayer *textLayer;

@end

@implementation CircleLayer

//frame.origin in the center of circle,no use
-(instancetype)initWithFrame:(CGRect) frame
{
    self = [super init];
    if(self){
      
        CGPoint centerPoint = CGPointMake(frame.origin.x, frame.origin.y);
        
        CGRect bounds =  CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.frame  = frame;
        UIBezierPath *bigCircle = [UIBezierPath bezierPathWithOvalInRect:bounds];
        self.path = bigCircle.CGPath;
        self.strokeColor = [[UIColor redColor] CGColor];
        self.lineWidth = 3.0;
        self.fillColor = [[UIColor whiteColor] CGColor];
        
        self.position = centerPoint;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect) frame hasLaber:(BOOL)hasLaber numberInLaber:(NSNumber*)number{
    self = [super init];
    if(self){
        
        CGFloat widthSize = frame.size.width;
        CGFloat heightSize = frame.size.height;
        CGFloat xCenter = frame.origin.x;
        CGFloat yCenter = frame.origin.y;
        CGFloat diam = widthSize * 8;
        
        self.frame = CGRectMake(0, 0, diam, diam);
        self.position = CGPointMake(xCenter, yCenter);
        
      
        self.pointLayer = [CAShapeLayer layer];
        self.pointLayer.frame = CGRectMake(0, 0, widthSize, heightSize);
        self.pointLayer.position = CGPointMake(diam/2, diam/2);
        UIBezierPath *bigCircle = [UIBezierPath bezierPathWithOvalInRect:self.pointLayer.bounds];
        self.pointLayer.path = bigCircle.CGPath;
        self.pointLayer.strokeColor = [[UIColor redColor] CGColor];
        self.pointLayer.lineWidth = 3.0;
        self.pointLayer.fillColor = [[UIColor whiteColor] CGColor];
        
        if(hasLaber)
        {
            self.laberLayer = [CAShapeLayer layer];
            self.laberLayer.frame = CGRectMake(0, 0, diam, diam / 3);
            UIBezierPath *laberPath = [UIBezierPath bezierPathWithRect:self.laberLayer.frame];
            [laberPath setLineCapStyle:kCGLineCapSquare];
            self.laberLayer.path = laberPath.CGPath;
            self.laberLayer.fillColor = [[UIColor redColor] CGColor];
            //self.laberLayer.lineCap = kCGLineCapSquare;
            self.laberLayer.cornerRadius = 12;
            self.laberLayer.masksToBounds=YES;
            [self addSublayer:self.laberLayer];
            
            self.textLayer = [CATextLayer layer];
            self.textLayer.frame = CGRectMake(diam/4, 3.5, diam, diam / 3);
            self.laberLayer.position = CGPointMake(diam/2, diam/6);
            self.textLayer.fontSize = 16;
            self.laberLayer.contentsScale = 3;
            //self.textLayer.position =
            self.textLayer.string = @"3.85%";
 //           self.textLayer.foregroundColor
            [self.laberLayer addSublayer:self.textLayer];
        }

        
        [self addSublayer:self.pointLayer];
        
        //self.backgroundColor = [[UIColor purpleColor] CGColor];
    }
        
        
        
    
        
//        self = [self initWithFrame:frame];
//        if(hasLaber)
//        {
//            self.laberLayer = [CAShapeLayer layer];
//            CGFloat widthSize = frame.size.width;
//            CGFloat heightSize = frame.size.height;
//            CGRect rect = CGRectMake(0, 0, widthSize*5, heightSize*1.3);
//            self.bounds =rect;
//            UIBezierPath *laberPath = [UIBezierPath bezierPathWithRect:rect];
//    
//            self.laberLayer.path = laberPath.CGPath;
//            self.laberLayer.position =
//            
//            
//        }
    
//    }
    return self;
}
@end

