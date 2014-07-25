//
//  UIWebView+Block.h
//  YJShare
//
//  Created by ylang on 14-7-25.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 USAGE FOR NSURLRequests
 
 example 1:
     UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"http://google.com"]]
     loaded:^(UIWebView *webView) {
     NSLog(@"Loaded successfully");
     }
     failed:^(UIWebView *webView, NSError *error) {
     NSLog(@"Failed loading %@", error);
     }];
     
 
 example 2:
     UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"http://google.com"]]
     loaded:^(UIWebView *webView) {
     NSLog(@"Loaded successfully");
     }
     failed:^(UIWebView *webView, NSError *error) {
     NSLog(@"Failed loading %@", error);
     }
     loadStarted:^(UIWebView *webView) {
     NSLog(@"Started loading %@", webView.request.URL.absoluteString);
     }
     shouldLoad:^BOOL(UIWebView *webView, UIWebViewNavigationType navigationType) {
     return YES;
     }];
 
 USAGE FOR HTML Strings
     UIWebView *webView = [UIWebView loadHTMLString:htmlString
     loaded:^(UIWebView *) {
     NSLog(@"Loaded successfully");
     }
     failed:^(UIWebView *, NSError *) {
     NSLog(@"Failed loading %@", error);
     }];
 
 
     UIWebView *webView = [UIWebView loadHTMLString:htmlString
     loaded:^(UIWebView *) {
     NSLog(@"Loaded successfully");
     }
     failed:^(UIWebView *, NSError *) {
     NSLog(@"Failed loading %@", error);
     }
     loadStarted:^(UIWebView *webView) {
     NSLog(@"Started loading %@", webView.request.URL.absoluteString);
     }
     shouldLoad:^BOOL(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
     return YES;
     }];
 */


/**
 UIWebView+Blocks is a simple Block implementation for UIWebView created by Shai Mishali.
 This class currently doesn't support simultaneous UIWebViews in the the same view.
 */
@interface UIWebView (Block) <UIWebViewDelegate>

/**
 Set TRUE_END_REPORT to YES to get notified only when the page has *fully* loaded, and not when every single element loads. (still not fully tested). When this is set to NO, it will work exactly like the UIWebViewDelegate. (Default behavior)
 */
#define TRUE_END_REPORT NO

/**
 Load a request and get notified when a web page is loaded successfully or fails to load
 
 @param request NSURLRequest to load
 @param loadedBlock Callback block called when loading is done
 @param failureBlock Callback block called when loading
 
 @return The generated UIWebView
 */
+ (UIWebView *) loadRequest: (NSURLRequest *) request
                     loaded: (void (^)(UIWebView *webView)) loadedBlock
                     failed: (void (^)(UIWebView *webView, NSError *error)) failureBlock;

/**
 Load a request and get notified when a web page is loaded successfully, fails to load, or started to load. Also, set whether or not a certain page should be loaded.
 
 @param request NSURLRequest to load
 @param loadedBlock Callback block called when loading is done
 @param failureBlock Callback block called when loading
 @param loadStartedBlock Callback block called when loading started
 @param shouldLoadBlock Callback block determining whether or not a specific page should be loaded.
 
 @return The generated UIWebView
 */
+ (UIWebView *) loadRequest: (NSURLRequest *) request
                     loaded: (void (^)(UIWebView *webView)) loadedBlock
                     failed: (void (^)(UIWebView *webView, NSError *error)) failureBlock
                loadStarted: (void (^)(UIWebView *webView)) loadStartedBlock
                 shouldLoad: (BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType)) shouldLoadBlock;

/**
 Load a HTML string and get notified when the web page is loaded successfully or failed to load.
 
 @param htmlString NSString containing HTML which should be loaded
 @param loadedBlock Callback block called when loading is done
 @param failureBlock Callback block called when loading
 
 @return The generated UIWebView
 */
+(UIWebView *)loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *webView))loadedBlock
                      failed:(void (^)(UIWebView *webView, NSError *error))failureBlock;

/**
 Load a HTML string and get notified when the web page is loaded successfully, failed to load or started to load.
 Also set whether or not a certain page should be loaded.
 
 @param htmlString NSString containing HTML which should be loaded.
 @param loadedBlock Callback block called when loading is done
 @param failureBlock Callback block called when loading
 @param loadStartedBlock Callback block called when loading started
 @param shouldLoadBlock Callback block determining whether or not a specific page should be loaded.
 
 @return The generated UIWebView
 */
+(UIWebView *)loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *))loadedBlock
                      failed:(void (^)(UIWebView *, NSError *))failureBlock
                 loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
                  shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock;
@end