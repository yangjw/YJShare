//
//  NSArray+help.h
//  TestPan
//
//  Created by yangjw  on 13-3-27.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (help)


/**
	数字从小到大
	@param array
	@returns array
 */
- (NSArray *)lowerSorteArray:(NSArray *)array;

/**
	数字从大到小
	@param array
	@returns array
 */
- (NSArray *)upperSorteArray:(NSArray *)array;



/**
	字母排序 默认升序
	@param array
	@returns array
 */
- (NSArray *)lowerCaseSoreteArray:(NSArray *)array;

/**
     字母排序 ，升序还是降序
	@param array 
	@param asc yes升序排列，no,降序排列
	@returns array
 */
- (NSArray *)lowerCaseSoreteArray:(NSArray *)array asc:(BOOL)asc;
/**
 *  是否为空
 *
 *  @param index
 *
 *  @return 
 */
- (id)verifiedObjectAtIndex:(NSUInteger)index;
@end
