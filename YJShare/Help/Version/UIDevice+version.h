//
//  UIDevice+version.h
//  Example
//
//  Created by yangjw  on 12-11-20.
//  Copyright (c) 2012年 yangjw . All rights reserved.
//

#pragma once
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//needs: SystemConfiguration.framework
#import <SystemConfiguration/SCNetworkReachability.h>

//needs: CoreLocation.framework
#import <CoreLocation/CoreLocation.h>

@interface UIDevice (version)

/**
 Returns `YES` if the device is a simulator.
 
 @return `YES` if the device is a simulator and `NO` if it is not.
 */

+ (BOOL)isSimulator;


/**
	检测是否有网络
	@returns 是否有网络
 */
+(BOOL)isExistenceNetwork;


+ (BOOL)checkConnection:(SCNetworkReachabilityFlags*)flags;

+ (BOOL)connectedToNetwork;

/**
	检测wifi
	@returns 是否有wifi
 */
+ (BOOL)connectedToWiFi;


+ (NSString*)name;

+ (NSString*)model;

+ (NSString*)systemVersion;

+ (NSString*)systemName;

+ (NSString*)appVersion;

+ (NSString*)appName;
//判读是否越狱
+ (BOOL)isJailbroken;

/*
 * iPhone Simulator == i386
 * iPhone == iPhone1,1
 * 3G iPhone == iPhone1,2
 * 3GS iPhone == iPhone2,1
 * 4 iPhone == iPhone3,1
 * 1st Gen iPod == iPod1,1
 * 2nd Gen iPod == iPod2,1
 * 3rd Gen iPod == iPod3,1
 */
+ (NSString*)machine;


+ (BOOL)cameraSupported;

+ (BOOL)compassSupported;
@end
