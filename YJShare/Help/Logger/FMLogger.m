//
//  FMLogger.m
//  
//  Created by Felix Mo on 11-08-21.
//
//  Copyright (c) 2011 Felix Mo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "FMLogger.h"


// Writes to the log file and messages sent to the console are done in the background so that the main thread isn't blocked by logging
dispatch_queue_t backgroundQueue;


//  Private interface declaration
// -------------------------------

@interface FMLogger ()
    
- (NSString *)stringForLevel:(FMLoggerLevel)level;
- (void)createLogFile;
- (void)writeEntryToLogFile:(NSString *)entry;
- (void)deleteOldLogs;
+ (NSDateFormatter *)dateFormatter; // Returns the shared NSDateFormatter for the calling thread; NSDateFormatter is not thread-safe

@property (nonatomic, retain) NSString *logsFolderPath;     // Path to the logs directory
@property (nonatomic, retain) NSString *currentLogFile;     // Name of the active log file

@end


@implementation FMLogger


#pragma mark - Property synthesizations

@synthesize logsFolderPath;
@synthesize currentLogFile;


#pragma mark - Static variables

static FMLogger *sharedLogger = nil;


#pragma mark - Memory management

- (void)dealloc {
    
    dispatch_release(backgroundQueue);
    [logsFolderPath release];
    [currentLogFile release];
    [super dealloc];
}


#pragma mark - Initalization

- (id)init {
    
    self = [super init];
    if (self) {
              
        backgroundQueue = dispatch_queue_create(FM_BACKGROUND_QUEUE_LABEL, NULL);
        
        // Get path to logs directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.logsFolderPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:FM_LOGS_DEFAULT_FOLDER_NAME];
        
        // Create logs directory if it does not exist
        BOOL isDirectory;
        if (![[NSFileManager defaultManager] fileExistsAtPath:self.logsFolderPath isDirectory:&isDirectory]) {
            
            NSError *error;
            
            if (![[NSFileManager defaultManager] createDirectoryAtPath:self.logsFolderPath 
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:&error]) {
                
                NSLog(@"Could not create logs directory at path: %@ | Error: %@", self.logsFolderPath, [error localizedDescription]);
                self.logsFolderPath = nil;
            }
        }
        
        // Create log file for today
        [self createLogFile];
        
        // Delete logs that have exceeded the maximum age
        [self deleteOldLogs];
                    
        return self; 
    }
    
    return nil;
}


#pragma mark - Class methods

+ (id)sharedLogger {
    
    if (sharedLogger == nil) {
        @synchronized(self) {
            sharedLogger = [[self alloc] init];
        }
    }
    
    return sharedLogger;
}

+ (NSDateFormatter *)dateFormatter {

    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    
    NSDateFormatter *dateFormatter = [threadDictionary objectForKey:FM_DATE_FORMATTER_KEY];
    if (!dateFormatter) {
        dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        [dateFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [threadDictionary setObject: dateFormatter forKey:FM_DATE_FORMATTER_KEY];
    }
    
    return dateFormatter;
}


#pragma mark - Private helper methods

// Return the string value for a FMLoggerLevel value
- (NSString *)stringForLevel:(FMLoggerLevel)level {
    
    switch (level) {
        case FMLoggerLevelVerbose:
            return @"VERB.";
            break;
        case FMLoggerLevelError:
            return @"ERROR";
            break;
        case FMLoggerLevelInfo:
            return @"INFO.";
            break;
        case FMLoggerLevelWarning:
            return @"WARN.";
            break;
            
        default:
            return @"UNDEF";
            break;
    }
}


#pragma mark - File management

- (void)deleteOldLogs {
    
    NSDate *expirationDate = [NSDate dateWithTimeIntervalSinceNow:-FM_LOGS_MAX_AGE];
    NSDirectoryEnumerator *dirEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:logsFolderPath];
    
    for (NSString *fileName in dirEnumerator) {
        
        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:[logsFolderPath stringByAppendingPathComponent:fileName] error:NULL];
        if ([[[attrs fileCreationDate] laterDate:expirationDate] isEqualToDate:expirationDate]) {
            
            [[NSFileManager defaultManager] removeItemAtPath:[logsFolderPath stringByAppendingPathComponent:fileName] error:NULL];
        }
    }
}

- (void)createLogFile {
        
    [[FMLogger dateFormatter] setDateFormat:FM_LOGS_FILENAME_FORMAT];
    
    NSString *fileName = [[NSString alloc] initWithString:[[[FMLogger dateFormatter] stringFromDate:[NSDate date]] stringByAppendingString:@".txt"]];
    self.currentLogFile = fileName;
    [fileName release];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.logsFolderPath stringByAppendingPathComponent:self.currentLogFile]]) {
        
        if (![[NSFileManager defaultManager] createFileAtPath:[self.logsFolderPath stringByAppendingPathComponent:self.currentLogFile]
                                                     contents:nil
                                                   attributes:nil]) {
            
            NSLog(@"Could not create log file at path: %@", [self.logsFolderPath stringByAppendingPathComponent:self.currentLogFile]);
            self.currentLogFile = nil;
        }
    }
}

- (void)writeEntryToLogFile:(NSString *)entry {
        
    [self createLogFile];   // Call each time so that a new log file is created if the date changes
    
    if (!self.logsFolderPath || !self.currentLogFile) return;
    
    dispatch_async(backgroundQueue, ^{
       
        NSFileHandle *logFile = [NSFileHandle fileHandleForUpdatingAtPath:[self.logsFolderPath stringByAppendingPathComponent:self.currentLogFile]];
        
        // If there is existing data in the log file, begin writing to the file on a new line at the end of the file
        NSData *logBeginning = [logFile readDataOfLength:1];
        if ([logBeginning length] > 0) {
            NSString *newLine = @"\n";
            [logFile seekToEndOfFile];
            [logFile writeData:[NSData dataWithBytes:[newLine UTF8String] length:[newLine length]]];
        }
        
        [logFile writeData:[NSData dataWithBytes:[entry UTF8String] length:[entry length]]];
        [logFile synchronizeFile];
        [logFile closeFile];
    });
}


#pragma mark - Logger methods

- (void)logEventAtLevel:(FMLoggerLevel)level withMessage:(NSString *)fmt, ... {
    
    va_list args;
    va_start(args, fmt);
    NSString *msg = [[NSString alloc] initWithFormat:fmt arguments:args];
    va_end(args);
    
    [[FMLogger dateFormatter] setDateFormat:FM_FORMAT_MSG_TIMESTAMP];
    
    NSString *output = [[NSString alloc] initWithFormat:FM_FORMAT_MSG, [[FMLogger dateFormatter] stringFromDate:[NSDate date]], [self stringForLevel:level], msg];
    
    dispatch_async(backgroundQueue, ^{
       NSLog(@"%@", output); 
    });
    
    [self writeEntryToLogFile:output];
    
    [msg release];
    [output release];
}

- (void)logEventAtLevel:(FMLoggerLevel)level forFunction:(const char *)func atLine:(int)line withMessage:(NSString *)fmt, ... {

    if (!func || !line || !FM_LOGS_INCLUDE_FUNC_AND_LINE) {
        
        [self logEventAtLevel:level withMessage:fmt];
        return;
    }
    
    va_list args;
    va_start(args, fmt);
    NSString *msg = [[NSString alloc] initWithFormat:fmt arguments:args];
    va_end(args);
    
    [[FMLogger dateFormatter] setDateFormat:FM_FORMAT_MSG_TIMESTAMP];
    
    NSString *output = [[NSString alloc] initWithFormat:FM_FORMAT_FUNC_LINE_MSG, [[FMLogger dateFormatter] stringFromDate:[NSDate date]], [self stringForLevel:level], msg, func, line];
    
    dispatch_async(backgroundQueue, ^{
        NSLog(@"%@", output);
    });

    [self writeEntryToLogFile:output];
    
    [msg release];
    [output release];
}

@end
