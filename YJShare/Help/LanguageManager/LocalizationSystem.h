//
//  LocalizationSystem.h
//  YJShare
//
//  Created by yangjw  on 13-12-10.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define ICLocalizedString(key, comment) \
[[LocalizationSystem shared] localizedStringForKey:(key) value:@"" table:nil]
#define ICLocalizedStringFromTable(key, tbl, comment) \
[[LocalizationSystem shared] localizedStringForKey:(key) value:@"" table:(tbl)]

#define ICLocalizedStringWithDefaultValue(key, tbl, val, comment) \
[[LocalizationSystem shared] localizedStringForKey:(key) value:(val) table:(tbl)]

#define ICLocalizedViewController(class) \
[[LocalizationSystem shared] localizedViewController:(class)]

#define ICLocalizedImage(name) \
[[LocalizationSystem shared] localizedImage:(name)]

#define ICLocalizationSetLanguage(language) \
[[LocalizationSystem shared] setLanguage:(language)]

#define ICLocalizationReset \
[[LocalizationSystem shared] resetLocalization]

@interface LocalizationSystem : NSObject

+ (LocalizationSystem *)shared;

// gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key
                              value:(NSString *)value
                              table:(NSString *)tableName;

// gets instance of viewcontroller with localized nib.
- (id) localizedViewController: (Class) vcClass;

// gets instance of localized image
- (UIImage *) localizedImage:(NSString *)name;

// sets the language
- (void) setLanguage:(NSString*) language;
- (NSString *) language;

// resets this system.
- (void) resetLocalization;

@end

/**
 en,
 
 "zh-Hant",繁体中文
 
 "zh-Hans",简体中文
 
 fr,
 
 de,
 
 ja,
 
 nl,
 
 it,
 
 es,
 
 pt,
 
 "pt-PT",
 
 da,
 
 fi,
 
 nb,
 
 sv,
 
 ko,
 
 ru,
 
 pl,
 
 tr,
 
 uk,
 
 ar,
 
 hr,
 
 cs,
 
 el,
 
 he,
 
 ro,
 
 sk,
 
 th,
 
 id,
 
 "en-GB",
 
 ca,
 
 hu,
 
 vi
 */
