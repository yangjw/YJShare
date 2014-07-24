//
//  UIDevice+version.m
//  Example
//
//  Created by yangjw  on 12-11-20.
//  Copyright (c) 2012年 yangjw . All rights reserved.
//

#import "UIDevice+version.h"

#import <sys/types.h>
#import <sys/socket.h>
#import <sys/sysctl.h>
#import <sys/time.h>
#import <netinet/in.h>
#import <net/if_dl.h>
#import <netdb.h>
#import <errno.h>
#import <arpa/inet.h>
#import <unistd.h>
#import <ifaddrs.h>
#import "Reachability.h"

#if !defined(IFT_ETHER)
#define IFT_ETHER 0x6	/* Ethernet CSMACD */
#endif

@implementation UIDevice (version)
#pragma mark -
#pragma mark network-related functions

+ (BOOL)isSimulator {
	static NSString *simulatorModel = @"iPhone Simulator";
	return [[[UIDevice currentDevice] model] isEqualToString:simulatorModel];
}

+(BOOL)isExistenceNetwork
{
	BOOL isExistenceNetwork;
	Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
     switch ([r currentReachabilityStatus]) {
          case NotReachable:
			isExistenceNetwork=FALSE;
               //   NSLog(@"没有网络");
               break;
          case ReachableViaWWAN:
			isExistenceNetwork=TRUE;
               //   NSLog(@"正在使用3G网络");
               break;
          case ReachableViaWiFi:
			isExistenceNetwork=TRUE;
               //  NSLog(@"正在使用wifi网络");
               break;
     }
     //	if (!isExistenceNetwork) {
     //		UIAlertView *myalert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"网络不存在" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil,nil];
     //		[myalert show];
     //		[myalert release];
     //	}
	return isExistenceNetwork;
}

+ (BOOL)checkConnection:(SCNetworkReachabilityFlags*)flags
{
	struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
	
	SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr*)&zeroAddress);
	BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, flags);
	CFRelease(defaultRouteReachability);
	
	if(!didRetrieveFlags)
		return NO;
	return YES;
}

+ (BOOL)connectedToNetwork
{
	SCNetworkReachabilityFlags flags;
	if(![UIDevice checkConnection:&flags])
		return NO;
	
	BOOL isReachable = flags & kSCNetworkReachabilityFlagsReachable;
	BOOL needsConnection = flags & kSCNetworkReachabilityFlagsConnectionRequired;
	
	return (isReachable && !needsConnection) ? YES : NO;
}

+ (BOOL)connectedToWiFi
{
	SCNetworkReachabilityFlags flags;
	if(![UIDevice checkConnection:&flags])
		return NO;
	
	BOOL isReachable = flags & kSCNetworkReachabilityFlagsReachable;
	BOOL needsConnection = flags & kSCNetworkReachabilityFlagsConnectionRequired;
	BOOL cellConnected = flags & kSCNetworkReachabilityFlagsTransientConnection;
	
	return (isReachable && !needsConnection && !cellConnected) ? YES : NO;
}

+ (BOOL)isJailbroken {
     BOOL jailbroken = NO;
     NSString *cydiaPath = @"/Applications/Cydia.app";
     NSString *aptPath = @"/private/var/lib/apt/";
     if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
          jailbroken = YES;
     }
     if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
          jailbroken = YES;
     }
     return jailbroken;
}

#pragma mark -

+ (NSString*)name
{
	return [[UIDevice currentDevice] name];
}

+ (NSString*)model
{
	return [[UIDevice currentDevice] model];
}

+ (NSString*)systemVersion
{
	return [[UIDevice currentDevice] systemVersion];
}

+ (NSString*)systemName
{
	return [[UIDevice currentDevice] systemName];
}

+ (NSString*)appVersion
{
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (NSString*)appName
{
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

+ (NSString*)bundleIdentifier
{
	return [[NSBundle mainBundle] bundleIdentifier];
}

//referenced: http://iphonedevelopertips.com/device/determine-if-iphone-is-3g-or-3gs-determine-if-ipod-is-first-or-second-generation.html
+ (NSString*)machine
{
	size_t size;
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
     
	char *name = malloc(size);
	sysctlbyname("hw.machine", name, &size, NULL, 0);
     
	NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
	free(name);
     
	return machine;
}

#pragma mark -
#pragma mark functions that check device features

//check: http://developer.apple.com/iphone/library/documentation/General/Reference/InfoPlistKeyReference/Articles/iPhoneOSKeys.html#//apple_ref/doc/uid/TP40009252-SW3

+ (BOOL)cameraSupported
{
	return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL)compassSupported
{
#ifdef __IPHONE_4_0
	return [CLLocationManager headingAvailable];
#else	//location.headingAvailable deprecated
	CLLocationManager* location = [[CLLocationManager alloc] init];
	BOOL supported = location.headingAvailable;
	[location release];
	return supported;
#endif
}


@end
