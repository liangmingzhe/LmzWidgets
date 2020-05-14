//
//  BatteryView.h
//  DemoForBattery
//
//  Created by benjaminlmz@qq.com on 2020/3/18.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,BatteryState) {
    BatteryStateNormal = 0,     //  正常状态
    BatteryStateCharging = 1,   //  充电状态
};

typedef NS_ENUM(NSInteger,TextStyle) {
    TextStyleHide = 0,     //  正常状态
    TextStyleTop = 1,     //  正常状态
    TextStyleBottom = 2,   //  充电状态
};
NS_ASSUME_NONNULL_BEGIN

@interface BatteryView : UIView
@property (nonatomic ,assign) BatteryState batteryState;
@property (nonatomic ,assign) TextStyle textStyle;
@end

NS_ASSUME_NONNULL_END
