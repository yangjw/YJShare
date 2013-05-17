//
//  VerticallyAlignedLabel.h
//  Verticall
//
//  Created by yangjw  on 13-2-20.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>

//top left
//label.textAlignment = UITextAlignmentLeft;
//label.contentMode = UIViewContentModeTop;

//top center
//label.textAlignment = UITextAlignmentCenter;
//label.contentMode = UIViewContentModeTop;

//top right
//label.textAlignment = UITextAlignmentRight;
//label.contentMode = UIViewContentModeTop;

//center left
//label.textAlignment = UITextAlignmentLeft;
//label.contentMode = UIViewContentModeCenter;

//center
//label.textAlignment = UITextAlignmentCenter;
//label.contentMode = UIViewContentModeCenter;

//center right
//label.textAlignment = UITextAlignmentRight;
//label.contentMode = UIViewContentModeCenter;

//bottom left
//label.textAlignment = UITextAlignmentLeft;
//label.contentMode = UIViewContentModeBottom;

//bottom center
//label.textAlignment = UITextAlignmentCenter;
//label.contentMode = UIViewContentModeBottom;

//bottom right
//label.textAlignment = UITextAlignmentRight;
//label.contentMode = UIViewContentModeBottom;
typedef enum VerticalAlignment {
     VerticalAlignmentTop,
     VerticalAlignmentMiddle,
     VerticalAlignmentBottom,
} VerticalAlignment;

@interface VerticallyAlignedLabel : UILabel
{
@private VerticalAlignment verticalAlignment_;
}

@property (nonatomic, assign) VerticalAlignment verticalAlignment;
@end