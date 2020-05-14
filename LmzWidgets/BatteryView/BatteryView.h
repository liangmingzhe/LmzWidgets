//
//  BatteryView.h
//  DemoForBattery
//
//  Created by benjaminlmz@qq.com on 2020/3/18.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LightningStyle.h"
typedef NS_ENUM(NSInteger,BatteryState) {
    BatteryStateNormal = 0,     //  正常状态
    BatteryStateCharging = 1,   //  充电状态
};

typedef NS_ENUM(NSInteger,TextStyle) {
    TextStyleHide = 0,      //  隐藏电量数字
    TextStyleTop = 1,       //  电量数字显示在顶部
    TextStyleBottom = 2,    //  电量数字显示在底部
};

NS_ASSUME_NONNULL_BEGIN

@interface BatteryView : UIView
@property (nonatomic ,assign) BatteryState batteryState;
@property (nonatomic ,assign) TextStyle textStyle;
@property (nonatomic ,assign) float percent;

@property (nonatomic ,strong) LightningStyle *lightningStyle;
@end

NS_ASSUME_NONNULL_END
