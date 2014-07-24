//
//  ShareInstance.h
//  YJShare
//
//  Created by yangjw  on 13-2-25.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>

#define SINGLETON_FOR_HEADER(CLASSNAME) +(CLASSNAME*)sharedInstance;

#define SINGLETON_FOR_CLASS(CLASSNAME) static CLASSNAME *shared##CLASSNAME = nil;

#if !__has_feature(objc_arc)
#define SINGLETON_FOR_FUNCTION(CLASSNAME)                       \
\
+ (CLASSNAME*)sharedInstance                                    \
{                                                               \
static dispatch_once_t pred;                                \
dispatch_once(&pred, ^{                                     \
shared##CLASSNAME = [[CLASSNAME alloc] init];           \
});                                                         \
return shared##CLASSNAME;                                   \
}                                                               \
\
+ (id)allocWithZone:(NSZone*)zone                               \
{                                                               \
@synchronized(self) {                                       \
if (shared##CLASSNAME == nil) {                             \
shared##CLASSNAME = [super allocWithZone:zone];     \
return shared##CLASSNAME;                           \
}                                                       \
}                                                           \
return nil;                                                 \
}                                                               \
\
- (id)copyWithZone:(NSZone*)zone                                \
{                                                               \
return self;                                                \
}                                                               \
\
- (id)retain                                                    \
{                                                               \
return self;                                                \
}                                                               \
\
- (unsigned)retainCount                                         \
{                                                               \
return UINT_MAX;                                            \
}                                                               \
\
- (oneway void)release                                          \
{                                                               \
}                                                               \
\
- (id)autorelease                                               \
{                                                               \
return self;                                                \
}
#else
#define SINGLETON_FOR_FUNCTION(CLASSNAME)                       \
\
+ (CLASSNAME*)sharedInstance                                    \
{                                                               \
static dispatch_once_t pred;                                \
dispatch_once(&pred, ^{                                     \
shared##CLASSNAME = [[CLASSNAME alloc] init];           \
});                                                         \
return shared##CLASSNAME;                                   \
}
#endif