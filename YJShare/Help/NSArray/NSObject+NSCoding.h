//
//  NSObject+NSCoding.h
//  YJShare
//
//  Created by ylang on 14-9-10.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//
/**
 *  https://github.com/greenisus/NSObject-NSCoding
 *
 *  @param NSCoding
 *
 *  @return
 */
#import <Foundation/Foundation.h>
@interface NSObject (NSCoding)

- (void)autoEncodeWithCoder: (NSCoder *)coder;
- (void)autoDecode:(NSCoder *)coder;
- (NSDictionary *)properties;

@end