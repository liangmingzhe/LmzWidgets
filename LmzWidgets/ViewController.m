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
@property (nonatomic ,strong) BatteryView *batterayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
}


- (void)initUI {
    //Battery View
    [self initBatteryView];

}

//battery view
- (void)initBatteryView {
    self.batterayView = [[BatteryView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2  - 50, 50, 100, 100)];
    self.batterayView.batteryState = BatteryStateCharging;
    self.batterayView.textStyle = TextStyleTop;
    [self.view addSubview:self.batterayView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (self.batterayView.percent < 1) {
            self.batterayView.percent = self.batterayView.percent + 0.001;
        }else {
            self.batterayView.percent = 0;
        }
    }];
    
    //
    for (NSInteger  i = 0; i < 4; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5 * (i + 1) - 45, 160, 80, 30)];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        btn.backgroundColor = [UIColor colorWithRed:0.2 green:0.7 blue:0.8 alpha:1];
        btn.layer.cornerRadius = 15;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(btnHandle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.tag = i;
        if (i == 0) {
            [btn setTitle:@"文字在顶部" forState:UIControlStateNormal];
        }
        if (i == 1) {
            [btn setTitle:@"文字在低部" forState:UIControlStateNormal];
        }
        if (i == 2) {
            [btn setTitle:@"显示闪电" forState:UIControlStateNormal];
        }
        if (i == 3) {
            [btn setTitle:@"隐藏闪电" forState:UIControlStateNormal];
        }
    }
}

- (void)btnHandle:(UIButton *)sender {
    if (sender.tag == 0) {
        self.batterayView.textStyle = TextStyleTop;
    }
    if (sender.tag == 1) {
        self.batterayView.textStyle = TextStyleBottom;
    }
    if (sender.tag == 2) {
        self.batterayView.batteryState = BatteryStateCharging;
    }
    if (sender.tag == 3) {
        self.batterayView.batteryState = BatteryStateNormal;
    }
}
@end
