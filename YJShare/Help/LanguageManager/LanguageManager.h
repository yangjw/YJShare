//
//  LanguageManager.h
//  YJShare
//
//  Created by yangjw  on 13-12-10.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLanguageChangedNotification @"LanguageChangedNotification"

#define GetLanguage [[LanguageManager getInstance] getLanguage]
#define LocalizedString(key, comment) [[LanguageManager getInstance] localizedStringForKey:(key) value:(comment)]

@interface LanguageManager : NSObject

+ (LanguageManager *) getInstance;
- (NSString *) localizedStringForKey:(NSString *)key value:(NSString *)comment;
- (void) setLanguage:(NSString *)language;
- (NSString *) getLanguage;

@end