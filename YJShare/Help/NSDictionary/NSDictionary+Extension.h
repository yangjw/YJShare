
//  NSDictionary+Extension.h

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

/**
	解析json数据，空指针问题
	@param key 键
	@returns 值
 */
- (NSString *)stringForKey:(NSString *)key;

@end
