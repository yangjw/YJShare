//
//  NSString+Category.h
//  YJShare
//
//  Created by ylang on 14-8-19.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)
/**
 *
 *字符串是否为空
 *  @return
 */
-(BOOL)isBlank;
/**
 *  是否为空或者nil
 *
 *  @return
 */
-(BOOL)isValid;
/**
 *  移除空格
 *
 *  @return
 */
- (NSString *)removeWhiteSpacesFromString;
/**
 *  字符串长度
 *
 *  @return 有多少个字符串
 */
- (NSUInteger)countNumberOfWords;
/**
 *  是否包含此字符串
 *
 *  @param subString 字符串
 *
 *  @return
 */
- (BOOL)containsString:(NSString *)subString;
/**
 *  判断是否以某个字符串开始
 *
 *  @param string 'aA-zZ'
 *
 *  @return
 */
- (BOOL)isBeginsWith:(NSString *)string;
/**
 *  判断是否以某个字符串结束
 *
 *  @param string ”aA-zZ‘
 *
 *  @return
 */
- (BOOL)isEndssWith:(NSString *)string;
/**
 *  替换字符串
 *
 *  @param olderChar 旧的字符串
 *  @param newerChar 新字符串
 *
 *  @return 当前字符串
 */
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
/**
 *  <#Description#>
 *
 *  @param begin <#begin description#>
 *  @param end   <#end description#>
 *
 *  @return <#return value description#>
 */
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
/**
 *  添加字符串
 *
 *  @param string 字符串
 *
 *  @return
 */
- (NSString *)addString:(NSString *)string;
/**
 * 移除指定字符串
 *
 *  @param subString 字符串
 *
 *  @return
 */
- (NSString *)removeSubString:(NSString *)subString;
/**
 *  判断是否是字符串
 *
 *  @return
 */
- (BOOL)containsOnlyLetters;
/**
 *  判断是否是数字
 *
 *  @return
 */
- (BOOL)containsOnlyNumbers;
/**
 *  是否只有数字和字符串
 *
 *  @return
 */
- (BOOL)containsOnlyNumbersAndLetters;
/**
 *  数组中是否包含此元素
 *
 *  @param array 数组
 *
 *  @return
 */
- (BOOL)isInThisarray:(NSArray*)array;
/**
 *  数组组合成字符串
 *
 *  @param array
 *
 *  @return
 */
+ (NSString *)getStringFromArray:(NSArray *)array;
/**
 *  字符串转换成数组
 *
 *  @return
 */
- (NSArray *)getArray;
/**
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMyApplicationVersion;
/**
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMyApplicationName;
/**
 *  
 *
 *  @return NSString->NSData
 */
- (NSData *)convertToData;
/**
 *  NSData ->NSString
 *
 *  @param data <#data description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getStringFromData:(NSData *)data;
/**
 *  邮箱
 *
 *  @return
 */
- (BOOL)isValidEmail;
/**
 *  手机号码
 *
 *  @return
 */
- (BOOL)isVAlidPhoneNumber;
/**
 *  链接
 *
 *  @return
 */
- (BOOL)isValidUrl;
@end
