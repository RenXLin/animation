//
//  RXLAnimation.m
//  animation
//
//  Created by renxlin on 14-10-13.
//  Copyright (c) 2014年 任小林. All rights reserved.
//

#import "RXLAnimation.h"


@implementation RXLAnimation
{
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //CAShapeLayer层的加入具有先后顺序
        self.backgroundColor = [UIColor redColor];
        //导轨层：
        _trackLayer = [CAShapeLayer new];
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = nil;
        self.progressWidth = 5;
        //指示进度层：
        _progressLayer = [CAShapeLayer new];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.fillColor = nil;
        _progressLayer.lineCap = kCALineCapButt;
        self.progressWidth = 5;
    }
    return self;
}

- (void)setTrack
{
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    _trackPath = [UIBezierPath bezierPathWithArcCenter:center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];;
    _trackLayer.path = _trackPath.CGPath;
}

- (void)setProgress
{
    NSLog(@"%f,%f",(self.bounds.size.width - _progressWidth)/ 2,MIN(CGRectGetHeight(self.frame), CGRectGetWidth(self.frame)));
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    _progressPath = [UIBezierPath bezierPathWithArcCenter:center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:- M_PI_2 endAngle:(M_PI * 2) * _progress - M_PI_2 clockwise:YES];
    _progressLayer.path = _progressPath.CGPath;
}

- (void)setProgressWidth:(float)progressWidth
{
    _progressWidth = progressWidth;
    _trackLayer.lineWidth = _progressWidth;
    _progressLayer.lineWidth = _progressWidth;
    
    [self.layer removeAllAnimations];
    [self setTrack];
    [self setProgress];
}

- (void)setTrackColor:(UIColor *)trackColor
{
    _trackLayer.strokeColor = trackColor.CGColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgress:(float)progress
{
    [self.layer removeAllAnimations];

    _progress = progress;
    
    [self setProgress];
}

-(void)setProgress:(float)progress animate:(BOOL)animated
{
    [self.layer removeAllAnimations];
    _progress = progress;
    [self setProgress];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
