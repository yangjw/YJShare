
//  NSDictionary+Extension.m


#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSString *)stringForKey:(NSString *)key
{
    id jsonValue = [self valueForKey:key];
    
    if (jsonValue == [NSNull null])
        return nil;
    
    return [jsonValue description];
}


-(id)objectForKeyedSubscript:(id)aKey {
	id obj = [self objectForKey:aKey];
	if ([obj isEqual:[NSNull null]] && [aKey isKindOfClass:[NSString class]]) {
		// You could fix all keys or the key only include the keyword could determinant here
		obj = @"";
	}
	return obj;
}

- (id)verifiedObjectForKey:(id)aKey
{
    if ([self objectForKey:aKey] && ![[self objectForKey:aKey] isKindOfClass:[NSNull class]]) return [self objectForKey:aKey];
    return nil;
}


@end
