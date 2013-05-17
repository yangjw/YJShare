//
//  ILPFilterGrayscale.m
//  CIFilterDemo
//
//  Created by Robin Wei on 23/1/13.
//  Copyright (c) 2013 Robin Wei. All rights reserved.
//

#import "ILPFilterGrayscale.h"

@implementation ILPFilterGrayscale
@synthesize inputImage;

- (CIImage *) outputImage {
//    [0.3f,0.59f,0.11f,0,0,0.3f,0.59f,0.11f,0,0,0.3f,0.59f,0.11f,0,0,0,0,0,1,0]
    CIVector *redVector = [CIVector vectorWithString:@"[0.3 0.59 0.11 0]"];
    CIVector *greenVector = [CIVector vectorWithString:@"[0.3 0.59 0.11 0]"];
    CIVector *blueVector = [CIVector vectorWithString:@"[0.3 0.59 0.11 0]"];
    CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
    return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}

@end
