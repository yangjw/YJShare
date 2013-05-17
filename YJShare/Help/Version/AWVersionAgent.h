//
//  AWVersionAgent.h
//  Example
//
//  Created by yangjw  on 13-2-25.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
 [self.window makeKeyAndVisible];
 
 [[AWVersionAgent sharedAgent] checkNewVersion];
 
 return YES;
 }
 
 - (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
 {
 [[AWVersionAgent sharedAgent] upgradeAppWithNotification:notification];
 }
 */
@interface AWVersionAgent : NSObject

+ (AWVersionAgent *)sharedAgent;

@property (nonatomic) BOOL debug;

- (void)checkNewVersion;
- (void)upgradeAppWithNotification:(UILocalNotification *)notification;

@end