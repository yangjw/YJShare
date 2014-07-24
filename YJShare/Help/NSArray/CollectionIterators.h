//  Created by Mirko Kiefer (http://www.mirkokiefer.com) on 3/14/11.

#import <Foundation/Foundation.h>



//[someArray forEach:^(id each) {
//	// do something with each element
//}];
//
//NSArray* filteredArray = [someArray filter:^(id each) {
//	return [each isEqual: aCoolObject];
//}];
//
//NSArray* collectedArray = [someArray collect: ^(id each) {
//	if([each isEqual: aCoolObject]) {
//		return @"cool";
//	} else {
//		return @"not cool";
//	}
//}];
//
//[someDictionary keysAndValues: ^(id key, id value) {
//	//do something with the current key and value
//}];

@interface NSArray(NSArrayIterators)

- (void)forEach: (void (^)(id each))block;

- (void)forEachIndexed: (void (^)(id each, NSUInteger index))block;

- (void)forEachWithOffset:(NSUInteger)offset stepSize:(NSUInteger)stepSize block: (void (^)(id each))block;

- (NSArray*)filter: (BOOL (^)(id each))block;

- (NSArray*)filterIndexed: (BOOL (^)(id each, NSUInteger index))block;

- (NSArray*)collect: (id (^)(id each))block;

- (NSArray*)collectIndexed: (id (^)(id each, NSUInteger index))block;

- (NSArray *)reversedArray;

- (BOOL)all:(BOOL (^)(id each))block;

- (BOOL)any:(BOOL (^)(id each))block;

- (id)objectForPredicate:(BOOL (^)(id each))block;

@end

@interface NSDictionary(NSDictionaryIterators)

- (void)keysAndValues: (void (^)(id key, id value))block;

@end

@interface NSNumber(NSNumberIterators)

- (void)forEach: (void (^)())block;

- (void)forEachIndexed: (void (^)(NSInteger each))block;

@end