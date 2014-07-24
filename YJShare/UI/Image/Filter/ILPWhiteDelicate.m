//
//  ILPWhiteDelicate.m
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import "ILPWhiteDelicate.h"

@implementation ILPWhiteDelicate
@synthesize inputImage = _inputImage;

- (CIImage *) outputImage {
     //[0.885295577413144f,0.0754633680341095f,0.159241054552747f,0,37.18f,
     //0.109984815932407f,1.02741600176475f,-0.017400817697161f,0,37.18f,
     //-0.0256691404609986f,0.284049559047626f,0.861619581413372f,0,37.18f,
     //0,0,0,1,0]

     CIVector *redVector = [CIVector vectorWithString:@"[0.885295577413144 0.0754633680341095 0.159241054552747 0]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[0.109984815932407 1.02741600176475 -0.017400817697161 0]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[-0.0256691404609986 0.284049559047626 0.861619581413372 0]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, _inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}

- (void)dealloc
{
     SAFE_RELEASE(_inputImage);
     [super dealloc];
}

@end
