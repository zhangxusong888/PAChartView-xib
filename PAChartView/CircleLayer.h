//
//  CircleLayer.h
//  MyButton
//
//  Created by xdq on 16/1/14.
//  Copyright © 2016年 com.xdq. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CircleLayer : CAShapeLayer

-(instancetype)initWithFrame:(CGRect) frame;
-(instancetype)initWithFrame:(CGRect) frame hasLaber:(BOOL)hasLaber numberInLaber:(NSNumber*)number;
@end
