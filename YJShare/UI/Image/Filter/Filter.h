//
//  Filter.h
//  YJShare
//
//  Created by yangjw  on 13-2-25.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import "ILPFilterLomo.h"
#import "ILPWormwood.h"
#import "ILPWhiteDelicate.h"
#import "ILPTreasure.h"
#import "ILPJapanese.h"
#import "ILPImpress.h"
#import "ILPFilterOldTime.h"
#import "ILPFilterGrayscale.h"
#import "ILPFilm.h"
#import "ILPBronze.h"
//滤镜
/*
 CIImage *inputImage;
 CIImage *outputImage;
 CIContext *contextImage;
 CIFilter *filter;
 
 NSURL *fileNameAndPath = [NSURL fileURLWithPath:kSAVESmallPath(@"filter.png")];
 inputImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
 
 contextImage = [CIContext contextWithOptions:NULL];
 filter = [CIFilter filterWithName:@"ILPFilterLomo" keysAndValues:kCIInputImageKey, inputImage, nil];
 
 outputImage = [filter outputImage];
 CGRect imgRect = [outputImage extent];
 CGImageRef cgimg = [contextImage createCGImage:outputImage fromRect:imgRect];
 UIImage *newImg = [UIImage imageWithCGImage:cgimg];
 [filterImgView setImage:newImg];
 CGImageRelease(cgimg);
 */