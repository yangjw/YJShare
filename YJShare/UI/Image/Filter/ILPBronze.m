//
//  ILPBronze.m
//  CIFilterDemo
//
//  Created by yangjw  on 13-1-24.
//  Copyright (c) 2013年 Robin Wei. All rights reserved.
//

#import "ILPBronze.h"

@implementation ILPBronze
@synthesize inputImage;

- (CIImage *) outputImage {
//[1.108343655086f,-0.126891509287854f,0.281708072736996f,0.02f,20.38f,
     //-0.0114357545765432f,1.10237866901967f,0.0538144235962147f,0.07f,20.38f,
     //-0.249436187281331f,0.651223412063502f,0.91821277521783f,0.112f,20.38f,0,0,0,1,0]

     CIVector *redVector = [CIVector vectorWithString:@"[1.108343655086 -0.126891509287854 0.281708072736996 0.02]"];
     CIVector *greenVector = [CIVector vectorWithString:@"[-0.0114357545765432 1.10237866901967 0.0538144235962147 0.07]"];
     CIVector *blueVector = [CIVector vectorWithString:@"[-0.249436187281331 0.651223412063502 0.91821277521783 0.112]"];
     CIVector *alphaVector = [CIVector vectorWithString:@"[0 0 0 1]"];
     return [CIFilter filterWithName:@"CIColorMatrix" keysAndValues:kCIInputImageKey, inputImage, @"inputRVector", redVector, @"inputGVector", greenVector, @"inputBVector", blueVector, @"inputAVector", alphaVector, nil].outputImage;
}
@end
