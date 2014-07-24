//
//  ILPTreasure.m
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import "ILPTreasure.h"

@implementation ILPTreasure
@synthesize inputImage;

- (CIImage *) outputImage {
     // [0.413976437525616f,0.186772148598797f,1.57720428892682f,0,15.375f,
     //0.401716321597331f,0.900141098043673f,-0.251857419641004f,0,15.375f,
     //-0.365028012810659f,1.82703494236592f,0.112006929555263f,0.01f,15.375f,
     //0.2f,0,0,1,0]
     CIVector *redVector = [CIVector vectorWithString:@"[0.413976437525616 0.186772148598797 1.57720428892682 0]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[0.401716321597331 0.900141098043673 -0.251857419641004 0]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[-0.365028012810659 1.82703494236592 0.112006929555263 0.01]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}
@end
