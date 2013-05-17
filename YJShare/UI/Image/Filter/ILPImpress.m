//
//  ILPImpress.m
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import "ILPImpress.h"
//映象
@implementation ILPImpress
@synthesize inputImage;

- (CIImage *) outputImage {
     //[1.3327396603539f,-0.505208015190274f,0.0724683548363732f,0,24.35f,
     //-0.187398764181987f,1.18116473638179f,-0.0937659721998039f,0,24.35f,
     //-0.315060138371619f,-0.30891149358686f,1.52397163195848f,0,24.35f,0,0,0,1,0]

     CIVector *redVector = [CIVector vectorWithString:@"[1.3327396603539 -0.505208015190274 0.0724683548363732 0]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[-0.187398764181987 1.18116473638179 -0.0937659721998039 0]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[-0.315060138371619 -0.30891149358686 1.52397163195848 0]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}
@end
