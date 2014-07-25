//
//  UIButton+Block.h
//  YJShare
//
//  Created by ylang on 14-7-25.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 [button addAction:^(UIButton *btn) {
 
 }];
 
 [button addAction:^(UIButton *btn) {
 
 } forControlEvents:UIControlEventTouchUpOutside];
 */


typedef void(^ButtonBlock)(UIButton* btn);

@interface UIButton (Block)

- (void)addAction:(ButtonBlock)block;
- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;

@end
