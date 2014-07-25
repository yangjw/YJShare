//
//  UIAlertView+Blocks.h
//  YJShare
//
//  Created by ylang on 14-7-25.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 use
 example 1:
     [UIAlertView showWithTitle:@"Drink Selection"
     message:@"Choose a refreshing beverage"
     cancelButtonTitle:@"Cancel"
     otherButtonTitles:@[@"Beer", @"Wine"]
     tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
     if (buttonIndex == [alertView cancelButtonIndex]) {
     NSLog(@"Cancelled");
     } else if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Beer"]) {
     NSLog(@"Have a cold beer");
     } else if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Wine"]) {
     NSLog(@"Have a glass of chardonnay");
     }
     }];
 
 example 2:
     UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Sign in to my awesome service"
     message:@"I promise I won’t steal your password"
     delegate:self
     cancelButtonTitle:@"Cancel"
     otherButtonTitles:@"OK", nil];
     
     av.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
     
     av.tapBlock = ^(UIAlertView *alertView, NSInteger buttonIndex) {
     if (buttonIndex == alertView.firstOtherButtonIndex) {
     NSLog(@"Username: %@", [[alertView textFieldAtIndex:0] text]);
     NSLog(@"Password: %@", [[alertView textFieldAtIndex:1] text]);
     } else if (buttonIndex == alertView.cancelButtonIndex) {
     NSLog(@"Cancelled.");
     }
     };
     
     av.shouldEnableFirstOtherButtonBlock = ^BOOL(UIAlertView *alertView) {
     return ([[[alertView textFieldAtIndex:1] text] length] > 0);
     };
     
     [av show];
 
 */

typedef void (^UIAlertViewBlock) (UIAlertView *alertView);
typedef void (^UIAlertViewCompletionBlock) (UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (Blocks)

+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
                        style:(UIAlertViewStyle)style
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     tapBlock:(UIAlertViewCompletionBlock)tapBlock;

+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     tapBlock:(UIAlertViewCompletionBlock)tapBlock;

@property (copy, nonatomic) UIAlertViewCompletionBlock tapBlock;
@property (copy, nonatomic) UIAlertViewCompletionBlock willDismissBlock;
@property (copy, nonatomic) UIAlertViewCompletionBlock didDismissBlock;

@property (copy, nonatomic) UIAlertViewBlock willPresentBlock;
@property (copy, nonatomic) UIAlertViewBlock didPresentBlock;
@property (copy, nonatomic) UIAlertViewBlock cancelBlock;

@property (copy, nonatomic) BOOL(^shouldEnableFirstOtherButtonBlock)(UIAlertView *alertView);
@end
