//
//  NSArray+help.m
//  TestPan
//
//  Created by yangjw  on 13-3-27.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import "NSArray+help.h"



@implementation NSArray (help)
- (NSArray *)lowerSorteArray:(NSArray *)array
{
     NSArray *sorteArray = [array sortedArrayUsingComparator:^(id obj1, id obj2){
          if ([obj1 integerValue] > [obj2 integerValue]) {
               return (NSComparisonResult)NSOrderedDescending;
          }
          
          if ([obj1 integerValue] < [obj2 integerValue]) {
               return (NSComparisonResult)NSOrderedAscending;
          }
          
          return (NSComparisonResult)NSOrderedSame;
     }];
     return sorteArray;
}

- (NSArray *)upperSorteArray:(NSArray *)array
{
     NSArray *sorteArray = [array sortedArrayUsingComparator:^(id obj1, id obj2){
          if ([obj1 integerValue] > [obj2 integerValue]) {
               return (NSComparisonResult)NSOrderedAscending;
          }
          
          if ([obj1 integerValue] < [obj2 integerValue]) {
               return (NSComparisonResult)NSOrderedDescending;
          }
          
          return (NSComparisonResult)NSOrderedSame;
     }];
     return sorteArray;
}

- (NSArray *)lowerCaseSoreteArray:(NSArray *)array
{
     NSArray *myary = [array sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
          return (NSComparisonResult)[obj1 compare:obj2 options:NSNumericSearch];
     }];
     return myary;
}

- (NSArray *)lowerCaseSoreteArray:(NSArray *)array asc:(BOOL)asc
{
     NSSortDescriptor *sd1 = [NSSortDescriptor sortDescriptorWithKey:nil ascending:asc];
     NSArray *myary = [array sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sd1, nil]];//注意这里的ary进行排序后会生产一个新的数组指针
     return myary;
}


@end
