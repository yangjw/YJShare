//
//  ILPWormwood.m
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import "ILPWormwood.h"

@implementation ILPWormwood
@synthesize inputImage;

- (CIImage *) outputImage {
     //  0.8f,0,0,0.05f,40,
     //0.05f,0.95f,0,0.008f,20,
     //0.07f,0.3f,0.8f,0,20,
     //0,0,0,1,0]
 
     CIVector *redVector = [CIVector vectorWithString:@"[0.8 0 0 0.05]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[0.05 0.95 0 0.008]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[0.07 0.3 0.8 0]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}
@end
