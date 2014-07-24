//
//  ShareConstant.h
//  YJShare
//
//  Created by yangjw  on 13-2-25.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMLogger.h"
#import "UIDevice+version.h"

#ifdef UI_USER_INTERFACE_IDIOM
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#else
#define IS_IPAD (false)
#endif

#define IS_CONNECTED_NETWORK [UIDevice connectedToNetwork]
#define IS_CONNECTED_WIFI [UIDevice connectedToWiFi]

#define SGLog FMLoggerVerbose
#define SGLogInfo FMLoggerInfo
#define SGLogWarning FMLoggerWarning
#define SGLogError FMLoggerError

#define crm(t,l,w,h) CGRectMake(t,l,w,h)
#define cpm(x,y) CGPointMake(x,y)
#define csm(w,h) CGSizeMake(w,h)
#define ccei(t,l,b,r) UIEdgeInsetsMake(t,l,b,r)

#define ON_BN_CLICKED(button,sel) [button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside]

#define DEFAULT_NEW_OBJECT(obj) [[obj alloc] init]
#if !__has_feature(objc_arc)
#define DEFAULT_NEW_OBJECT_AUTORELEASE(obj) [[[obj alloc] init] autorelease]
#endif

#define SHOW_NAVIGATIONBAR(yesOrNo) self.navigationController.navigationBarHidden = !yesOrNo


#define FM_STRING(string) [NSString stringWithFormat:@"%@",string]
#define FM_INT(int) [NSString stringWithFormat:@"%d",int]
#define FM_FLOAT(float) [NSString stringWithFormat:@"%.2f",float]

#define DegreesToRadians(x) (M_PI * (x) / 180.0)
#define RadiansToDegrees(x) ((x) * 180.0 / M_PI)

#define ifSimulator ([[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location != NSNotFound)

#define isPad ([[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location != NSNotFound)

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define POST_NOTIFICATION(X) [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:X object:nil]];

#define TRY_TO_PERFORM(X) if ([_delegate respondsToSelector:@selector(X)]) {[_delegate X];}
