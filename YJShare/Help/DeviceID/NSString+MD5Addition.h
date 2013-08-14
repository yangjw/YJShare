//
//  NSString+MD5Addition.h
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(MD5Addition)

/**
	MD5 加密
	@returns 返回字符串
 */
- (NSString *) stringFromMD5;

@end
