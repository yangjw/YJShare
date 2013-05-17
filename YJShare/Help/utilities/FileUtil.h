//
//  FileUtil.h
//  iPhoneLib,
//  Helper Functions and Classes for Ordinary Application Development on iPhone
//
//  Created by meinside on 10. 01. 16.
//
//  last update: 12.08.14.
//

#pragma once
#import <Foundation/Foundation.h>


@interface FileUtil : NSObject {

}

typedef enum _PathType {
	PathTypeLibrary,
	PathTypeDocument,
	PathTypeResource,
	PathTypeBundle,
	PathTypeTemp,
	PathTypeCache,
} PathType;


+ (NSString*)pathForPathType:(PathType)type;

+ (NSString*)pathOfFile:(NSString*)filename withPathType:(PathType)type;

/**
	判断文件是否存在
	@param path 路径
	@returns YES：成功 NO：失败
 */
+ (BOOL)fileExistsAtPath:(NSString*)path;


/**
	拷贝当前文件去另外一个文件夹
	@param srcPath 原始路径
	@param dstPath 拷贝到的路径
	@returns YES：成功 NO：失败
 */
+ (BOOL)copyFileFromPath:(NSString*)srcPath toPath:(NSString*)dstPath;

/**
 *  @brief  删除路径文件
 *
 *  @param  path   源路径
 *
 *  @return         是否删除成功
 */
+ (BOOL)deleteFileAtPath:(NSString*)path;

/**
 *  @brief  创建文件夹
 *
 *  @param  path   路径
 *  @param  attributes   文件夹属性
 *
 *  @return         是否创建成功
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path withAttributes:(NSDictionary*)attributes;

/**
 *  @brief  创建文件
 *
 *  @param  path   路径
 *  @param  data   文件内容
 *  @param  attributes   文件属性
 *
 *  @return         是否创建成功
 */

+ (BOOL)createFileAtPath:(NSString*)path withData:(NSData*)data andAttributes:(NSDictionary*)attr;

/**
 *  @brief  得到文件内容
 *
 *  @param  path   路径
 *
 *  @return         是否创建成功
 */

+ (NSData*)dataFromPath:(NSString*)path;

+ (NSArray*)contentsOfDirectoryAtPath:(NSString*)path;

+ (unsigned long long int)sizeOfFolderPath:(NSString *)path;

+ (BOOL)skipBackupAtPath:(NSString*)path;


@end
