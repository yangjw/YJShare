//
//  LanguageManager.m
//  YJShare
//
//  Created by yangjw  on 13-12-10.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import "LanguageManager.h"

@implementation LanguageManager

static LanguageManager *_instance= nil;
static NSBundle *bundle = nil;
static NSString *_currentLanguage = nil;

+ (LanguageManager *)getInstance
{
    @synchronized(self)
    {
        if (_instance == nil) {
            _instance = [[LanguageManager alloc] init];
            
            // Reset localization
            _currentLanguage = nil;
            bundle = [NSBundle mainBundle];
        }
    }
    return _instance;
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
    return [bundle localizedStringForKey:key value:comment table:nil];
}

- (void)setLanguage:(NSString *)language
{
    if (_currentLanguage && [language isEqualToString:_currentLanguage]) {
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    _currentLanguage = language;
    
    if (path == nil) {
        // Reset localization
        _currentLanguage = nil;
        bundle = [NSBundle mainBundle];
        
        NSLog(@"Localization for %@ is not found.", language);
    } else {
        bundle = [NSBundle bundleWithPath:path];
        
        NSLog(@"Localization for %@ is loaded successfully.", language);
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kLanguageChangedNotification object:nil];
}

- (NSString *)getLanguage
{
    if (!_currentLanguage) {
        NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        _currentLanguage = [languages objectAtIndex:0];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:_currentLanguage ofType:@"lproj"];
        
        if (path == nil) {
            _currentLanguage = @"en";
            bundle = [NSBundle mainBundle];
        }
    }
    
    return _currentLanguage;
}

@end