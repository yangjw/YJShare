//
//  NSString+Hashes.h
//  YJShare
//
//  Created by yangjw  on 13-12-24.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *NSStringNotNull(NSString *string);

@interface NSString (Hashes)

- (NSString *)md5;
- (NSString *)sha1;
- (NSString *)sha256;
- (NSString *)sha512;

@end