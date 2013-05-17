
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

@end
