//
//  ILPBronze.h
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import <CoreImage/CoreImage.h>
//古铜色
@interface ILPBronze : CIFilter
{
     CIImage *inputImage;
}

@property (retain, nonatomic) CIImage *inputImage;
@end