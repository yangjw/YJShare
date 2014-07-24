//
//  RequestHttpSort.m
//  YJShare
//
//  Created by yangjw  on 13-12-23.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import "RequestHttpSort.h"

@implementation RequestHttpSort

//拼接键值对，按字母升序排序
+ (NSString *)mergeParamsWithAPI:(NSString *)apiString
                   andParamsDict:(NSDictionary *)parmsDict
{
    NSString *mergedParamsStr = [NSString stringWithFormat:@"/%@?", apiString];
    NSArray *AllKeys = [NSArray arrayWithArray:[parmsDict allKeys]];
    NSArray *sortedKeys = [AllKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    for (NSString * key in sortedKeys)
    {
        NSString *value = [NSString stringWithFormat:@"%@", [parmsDict objectForKey:key]];
        mergedParamsStr = [mergedParamsStr stringByAppendingFormat:@"%@=%@&", key, value];
    }
    mergedParamsStr = [mergedParamsStr substringWithRange:NSMakeRange(0,mergedParamsStr.length-1)];
    NSLog(mergedParamsStr);
    return mergedParamsStr;
}

+ (NSString *)mergeParamsAndFilterEmptyValueWithAPI:(NSString *)apiString
                                      andParamsDict:(NSDictionary *)parmsDict
{
    NSString *mergedParamsStr = [NSString stringWithFormat:@"/%@?", apiString];
    NSArray *AllKeys = [NSArray arrayWithArray:[parmsDict allKeys]];
    NSArray *sortedKeys = [AllKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    for (NSString * key in sortedKeys)
    {
        NSString *value = [NSString stringWithFormat:@"%@", [parmsDict objectForKey:key]];
        if ([value length] !=0)
        {
            mergedParamsStr = [mergedParamsStr stringByAppendingFormat:@"%@=%@&", key, value];
        }
    }
    
    mergedParamsStr = [mergedParamsStr substringWithRange:NSMakeRange(0,mergedParamsStr.length-1)];
    
    return mergedParamsStr;
}

@end
