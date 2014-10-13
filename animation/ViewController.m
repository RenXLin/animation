//
//  ViewController.m
//  animation
//
//  Created by renxlin on 14-10-13.
//  Copyright (c) 2014年 任小林. All rights reserved.
//

#import "ViewController.h"
#import "RXLAnimation.h"
@interface ViewController ()

@end

@implementation ViewController
{
    RXLAnimation *progress;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    progress = [[RXLAnimation alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
    [self.view addSubview:progress];
    progress.trackColor = [UIColor blackColor];
    progress.progressColor = [UIColor orangeColor];
    progress.progress = 0;
    progress.progressWidth = 5;

    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setPro) userInfo:nil repeats:YES];
}
-(void)setPro
{
    static NSInteger i= 0;
    i++;
    if (i == 100) {
        i = 0;
    }
    [progress setProgress:(float)i/100 animate:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
