//
//  YJShare.h
//  YJShare
//
//  Created by yangjw  on 13-2-25.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJShare : NSObject

/*
 //1、调用 自带mail
 
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://admin@hzlzh.com"]];
 
 
 
 //2、调用 电话phone
 
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://8008808888"]];
 
 1，这种方法，拨打完电话回不到原来的应用，会停留在通讯录里，而且是直接拨打，不弹出提示
 NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
 //            NSLog(@"str======%@",str);
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
 
 2，这种方法，打完电话后还会回到原来的程序，也会弹出提示，推荐这种
 NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
 UIWebView * callWebview = [[UIWebView alloc] init];
 [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
 [self.view addSubview:callWebview];
 [callWebview release];
 [str release];
 
 
 
 
 3,这种方法也会回去到原来的程序里（注意这里的telprompt），也会弹出提示
 NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"186xxxx6979"];
 //            NSLog(@"str======%@",str);
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]]
 
 //3、调用 SMS
 
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://800888"]];
 
 
 
 //4、调用自带 浏览器 safari
 
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.hzlzh.com"]];
 
 
 NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
 NSLog(@"============%@",adId);
 NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
 NSLog(@"++++++++++++++%@",idfv);
 */


NSUInteger DeviceSystemMajorVersion();

#define MY_MACRO_NAME (DeviceSystemMajorVersion() < 7)
@end
