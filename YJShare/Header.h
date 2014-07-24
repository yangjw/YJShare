//
//  Header.h
//  YJShare
//
//  Created by yangjw  on 13-9-4.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#ifndef YJShare_Header_h
#define YJShare_Header_h

#ifndef paixiu_PXISARC_h
#define paixiu_PXISARC_h
#ifndef PX_STRONG
#if __has_feature(objc_arc)
#define PX_STRONG strong
#else
#define PX_STRONG retain
#endif
#endif
#ifndef PX_WEAK
#if __has_feature(objc_arc_weak)
#define PX_WEAK weak
#elif __has_feature(objc_arc)
#define PX_WEAK unsafe_unretained
#else
#define PX_WEAK assign
#endif
#endif

#if __has_feature(objc_arc)
#define PX_AUTORELEASE(expression) expression
#define PX_RELEASE(expression) expression
#define PX_RETAIN(expression) expression
#else
#define PX_AUTORELEASE(expression) [expression autorelease]
#define PX_RELEASE(expression) [expression release]
#define PX_RETAIN(expression) [expression retain]
#endif
#endif

#endif





