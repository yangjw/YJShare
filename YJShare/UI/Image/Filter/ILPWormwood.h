//
//  ILPWormwood.h
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import <CoreImage/CoreImage.h>
//苦艾
@interface ILPWormwood : CIFilter
{
     CIImage *inputImage;
}

@property (retain, nonatomic) CIImage *inputImage;
@end