//
//  UIActionSheet+Blocks.h
//  YJShare
//
//  Created by ylang on 14-7-25.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

/*
 使用：
 example 1:
     [UIActionSheet showInView:self.view
     withTitle:@"Are you sure you want to delete all the things?"
     cancelButtonTitle:@"Cancel"
     destructiveButtonTitle:@"Delete all the things"
     otherButtonTitles:@[@"Just some of the things", @"Most of the things"]
     tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
     NSLog(@"Chose %@", [actionSheet buttonTitleAtIndex:buttonIndex]);
     }];
 example 2:
     UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"Choose a coffee"
     delegate:nil
     cancelButtonTitle:@"Cancel"
     destructiveButtonTitle:nil
     otherButtonTitles:@"Flat White", @"Latte", @"Cappuccino", @"Long Black", nil];
     
     as.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
     
     as.tapBlock = ^(UIActionSheet *actionSheet, NSInteger buttonIndex){
     NSLog(@"Chose %@", [actionSheet buttonTitleAtIndex:buttonIndex]);
     };
     
     [as showInView:self.view];
 */

#import <UIKit/UIKit.h>

typedef void (^UIActionSheetBlock) (UIActionSheet *actionSheet);
typedef void (^UIActionSheetCompletionBlock) (UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface UIActionSheet (Blocks)

+ (instancetype)showFromTabBar:(UITabBar *)tabBar
                     withTitle:(NSString *)title
             cancelButtonTitle:(NSString *)cancelButtonTitle
        destructiveButtonTitle:(NSString *)destructiveButtonTitle
             otherButtonTitles:(NSArray *)otherButtonTitles
                      tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showFromToolbar:(UIToolbar *)toolbar
                      withTitle:(NSString *)title
              cancelButtonTitle:(NSString *)cancelButtonTitle
         destructiveButtonTitle:(NSString *)destructiveButtonTitle
              otherButtonTitles:(NSArray *)otherButtonTitles
                       tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showInView:(UIView *)view
                 withTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                  tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             animated:(BOOL)animated
                            withTitle:(NSString *)title
                    cancelButtonTitle:(NSString *)cancelButtonTitle
               destructiveButtonTitle:(NSString *)destructiveButtonTitle
                    otherButtonTitles:(NSArray *)otherButtonTitles
                             tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showFromRect:(CGRect)rect
                      inView:(UIView *)view
                    animated:(BOOL)animated
                   withTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
      destructiveButtonTitle:(NSString *)destructiveButtonTitle
           otherButtonTitles:(NSArray *)otherButtonTitles
                    tapBlock:(UIActionSheetCompletionBlock)tapBlock;

@property (copy, nonatomic) UIActionSheetCompletionBlock tapBlock;
@property (copy, nonatomic) UIActionSheetCompletionBlock willDismissBlock;
@property (copy, nonatomic) UIActionSheetCompletionBlock didDismissBlock;

@property (copy, nonatomic) UIActionSheetBlock willPresentBlock;
@property (copy, nonatomic) UIActionSheetBlock didPresentBlock;
@property (copy, nonatomic) UIActionSheetBlock cancelBlock;

@end