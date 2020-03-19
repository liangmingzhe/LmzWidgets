//
//  AppDelegate.m
//  DemoForBattery
//
//  Created by benjaminlmz@qq.com on 2020/3/18.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.window setRootViewController:[[ViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
