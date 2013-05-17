//
//  ILPFilterOldTime.m
//  CIFilterDemo
//
//  Created by Robin Wei on 23/1/13.
//  Copyright (c) 2013 Robin Wei. All rights reserved.
//

#import "ILPFilterOldTime.h"

@implementation ILPFilterOldTime

@synthesize inputImage;

- (CIImage *) outputImage {
     //0.55059f,0.59611f,0.0033f,0.02f,0,
     //0.30059f,0.74611f,0,-0.04f,0,
     //0.00059f,0.59611f,0.3033f,-0.05f,0,
     //0,0,0,1,0
//    return [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey, inputImage, @"inputIntensity", [NSNumber numberWithFloat:0.5], nil].outputImage;
     CIVector *redVector = [CIVector vectorWithString:@"[0.55059 0.59611 0.0033 0]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[0.30059 0.74611 0 -0.04]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[0.00059 0.59611 0.3033 -0.05]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}

@end
