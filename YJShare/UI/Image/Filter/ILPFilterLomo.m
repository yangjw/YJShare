//
//  ILPFilterLomo.m
//  CIFilterDemo
//
//  Created by Robin Wei on 23/1/13.
//  Copyright (c) 2013 Robin Wei. All rights reserved.
//  Algorithm reference: http://blog.csdn.net/liliang497/article/details/8441920

#import "ILPFilterLomo.h"

#define SAFECOLOR(color) MIN(255,MAX(0,color))

@implementation ILPFilterLomo
@synthesize inputImage;

- (CIImage *) outputImage {
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef inImage = [context createCGImage:inputImage fromRect:[inputImage extent]];
    CFDataRef m_DataRef = CGDataProviderCopyData(CGImageGetDataProvider(inImage));
    
    int length = CFDataGetLength(m_DataRef);
    CFMutableDataRef m_DataRefEdit = CFDataCreateMutableCopy(NULL,length,m_DataRef);
    UInt8 * m_PixelBuf = (UInt8 *) CFDataGetMutableBytePtr(m_DataRefEdit);
    
    /***************************************************/
    size_t width = CGImageGetWidth(inImage);
    size_t height = CGImageGetHeight(inImage);
    size_t bytesPerRow = CGImageGetBytesPerRow(inImage);
    size_t bitsPerPixel = CGImageGetBitsPerPixel(inImage);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(inImage);
    size_t bytesPerPixel = bitsPerPixel / BitsPerComponent;
    
    int ratio = width > height ? height * 32768/ width : width * 32768 / height;
    
    int cx = width >> 1;
    int cy = height >> 1;
    int max = cx * cx + cy * cy;
    int min = (int)(max * 0.2);
    int diff = max - min;
    
    int ri, gi, bi;
    int dx, dy, distSq, v;
    
    int R, G, B;
    int newR, newG, newB;
    
    int value;
    
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            int offset = y * bytesPerRow + x * bytesPerPixel;
            R = m_PixelBuf[offset];
            G = m_PixelBuf[offset + 1];
            B = m_PixelBuf[offset + 2];
            
            value = R < 128 ? R : 256-R;
            newR = (value * value * value) / 64 / 256;
            newR = (R < 128 ? newR : 255-newR);
            
            value = G < 128 ? G : 256-G;
            newG = (value * value) / 128;
            newG = (G<128 ? newG : 255-newG);
            
            newB = (B >> 1) + 0x25;
            
            /* Edge Mark */
            dx = cx - x;
            dy = cy - y;
            if (width > height) {
                dx = (dx * ratio) >> 15;
            } else {
                dy = (dy * ratio) >> 15;
            }
            
            distSq = dx * dx + dy * dy;
            
            if (distSq > min) {
                v = ((max - distSq) << 8 ) / diff;
                v *= v;
                
                ri = (newR * v) >> 16;
                gi = (newG * v) >> 16;
                bi = (newB * v) >> 16;
                
                newR = SAFECOLOR(ri);
                newG = SAFECOLOR(gi);
                newB = SAFECOLOR(bi);
            }
            
            m_PixelBuf[offset] = newR;
            m_PixelBuf[offset + 1] = newG;
            m_PixelBuf[offset + 2] = newB;
        }
    }
    
    /***************************************************/
    
    CGContextRef ctx = CGBitmapContextCreate(m_PixelBuf,
                                             
                                             CGImageGetWidth(inImage),
                                             
                                             CGImageGetHeight(inImage),
                                             
                                             CGImageGetBitsPerComponent(inImage),
                                             CGImageGetBytesPerRow(inImage),
                                             
                                             CGImageGetColorSpace(inImage),
                                             
                                             CGImageGetBitmapInfo(inImage)
                                             );
    
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    
    CGContextRelease(ctx);
    CIImage *finalImage = [CIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGImageRelease(inImage);
    CFRelease(m_DataRef);
    CFRelease(m_DataRefEdit);
    return finalImage;
}

@end
