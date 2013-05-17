//
//  ILPJapanese.m
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import "ILPJapanese.h"

@implementation ILPJapanese
@synthesize inputImage;

- (CIImage *) outputImage {
// [1.17650356463966f,0.0789393757447161f,0.0854429403843784f,0,38.59f,
     //0.0123519064208443f,1.04591650606976f,-0.0264354003510805f,0.05f,38.59f,
     //0.0035662247797971f,0.0631712991121841f,1.14960507433239f,0.04f,38.59f,0,0,0,1,0]
  
     CIVector *redVector = [CIVector vectorWithString:@"[1.17650356463966 0.0789393757447161 0.0854429403843784 0]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[0.0123519064208443 1.04591650606976 -0.0264354003510805 0.05]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[0.0035662247797971 0.0631712991121841 1.14960507433239 0.04]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}
@end
