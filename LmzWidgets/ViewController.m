//
//  ViewController.m
//  DemoForBattery
//
//  Created by benjaminlmz@qq.com on 2020/3/18.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "ViewController.h"
#import "BatteryView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    BatteryView *bView = [[BatteryView alloc] initWithFrame:CGRectMake(100, 50, 35, 35)];
    bView.batteryState = 1;
    bView.textStyle = TextStyleBottom;
    [self.view addSubview:bView];
    
    BatteryView *a2View = [[BatteryView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:a2View];
    a2View.batteryState = 1;
    a2View.textStyle = TextStyleTop;
    
    BatteryView *b2View = [[BatteryView alloc] initWithFrame:CGRectMake(200, 100, 50, 50)];
    [self.view addSubview:b2View];
    b2View.batteryState = BatteryStateNormal;
    b2View.textStyle = TextStyleTop;

    
    BatteryView *b3View = [[BatteryView alloc] initWithFrame:CGRectMake(100, 160, 100, 100)];
    b3View.batteryState = BatteryStateNormal;
    b3View.textStyle = TextStyleTop;
    [self.view addSubview:b3View];
    
    
    BatteryView *b4View = [[BatteryView alloc] initWithFrame:CGRectMake(100, 310, 200, 200)];
    b4View.batteryState = 1;
    b4View.textStyle = TextStyleBottom;
    [self.view addSubview:b4View];
    
}


@end
