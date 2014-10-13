//
//  RXLAnimation.h
//  animation
//
//  Created by renxlin on 14-10-13.
//  Copyright (c) 2014年 任小林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXLAnimation : UIView

@property(nonatomic,strong)UIColor *trackColor;
@property(nonatomic,strong)UIColor *progressColor;
@property(nonatomic,assign)float progress;
@property(nonatomic,assign)float progressWidth;


-(void)setProgress:(float)progress animate:(BOOL)animated;



@end
