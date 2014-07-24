//
//  ILPFilterGrayscale.h
//  CIFilterDemo
//
//  Created by Robin Wei on 23/1/13.
//  Copyright (c) 2013 Robin Wei. All rights reserved.
//

#import <CoreImage/CoreImage.h>
//黑白
@interface ILPFilterGrayscale : CIFilter{
    CIImage *inputImage;
}

@property (retain, nonatomic) CIImage *inputImage;
@end
