//
//  ILPTreasure.h
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import <CoreImage/CoreImage.h>
//阿宝色
@interface ILPTreasure : CIFilter
{
     CIImage *inputImage;
}

@property (retain, nonatomic) CIImage *inputImage;

@end