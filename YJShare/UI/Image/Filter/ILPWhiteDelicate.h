//
//  ILPWhiteDelicate.h
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import <CoreImage/CoreImage.h>
//粉嫩
@interface ILPWhiteDelicate : CIFilter
{
     CIImage *_inputImage;
}

@property (retain, nonatomic) CIImage *inputImage;
@end