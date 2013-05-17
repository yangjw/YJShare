//
//  ILPFilm.m
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import "ILPFilm.h"

@implementation ILPFilm
@synthesize inputImage;

- (CIImage *) outputImage {
//[0.798129878219817f,-0.036923752252823f,0.138793874033006f,0,15.35f,
     //0.0505087867919643f,0.881030573130298f,-0.0315393599222624f,0.01f,15.35f,
     //-0.0803003854445344f,0.164212931938782f,0.816087453505752f,0.08f,15.35f,0,0,0,1,0]

     CIVector *redVector = [CIVector vectorWithString:@"[0.798129878219817 -0.036923752252823 0.138793874033006 0]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[0.0505087867919643 0.881030573130298 -0.0315393599222624 0.01]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[-0.0803003854445344 0.164212931938782 0.816087453505752 0.08]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}
@end
