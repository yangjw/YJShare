//
//  UIImage+Help.m
//  Example
//
//  Created by yangjw  on 12-11-7.
//  Copyright (c) 2012年 yangjw . All rights reserved.
//

#import "UIImage+Help.h"

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};
@implementation UIImage (Help)

-(UIImage *)imageAtRect:(CGRect)rect
{
     
     CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
     UIImage* subImage = [UIImage imageWithCGImage: imageRef];
     CGImageRelease(imageRef);
     
     return subImage;
     
}
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize {
     
     UIImage *sourceImage = self;
     UIImage *newImage = nil;
     
     CGSize imageSize = sourceImage.size;
     CGFloat width = imageSize.width;
     CGFloat height = imageSize.height;
     
     CGFloat targetWidth = targetSize.width;
     CGFloat targetHeight = targetSize.height;
     
     CGFloat scaleFactor = 0.0;
     CGFloat scaledWidth = targetWidth;
     CGFloat scaledHeight = targetHeight;
     
     CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
     
     if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
          
          CGFloat widthFactor = targetWidth / width;
          CGFloat heightFactor = targetHeight / height;
          
          if (widthFactor > heightFactor)
               scaleFactor = widthFactor;
          else
               scaleFactor = heightFactor;
          
          scaledWidth  = width * scaleFactor;
          scaledHeight = height * scaleFactor;
          
          // center the image
          
          if (widthFactor > heightFactor) {
               thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
          } else if (widthFactor < heightFactor) {
               thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
          }
     }
     
     
     // this is actually the interesting part:
     
     UIGraphicsBeginImageContext(targetSize);
     
     CGRect thumbnailRect = CGRectZero;
     thumbnailRect.origin = thumbnailPoint;
     thumbnailRect.size.width  = scaledWidth;
     thumbnailRect.size.height = scaledHeight;
     
     [sourceImage drawInRect:thumbnailRect];
     
     newImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     if(newImage == nil)
          NSLog(@"could not scale image");
     
     
     return newImage ;
}
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize {
     
     UIImage *sourceImage = self;
     UIImage *newImage = nil;
     
     CGSize imageSize = sourceImage.size;
     CGFloat width = imageSize.width;
     CGFloat height = imageSize.height;
     
     CGFloat targetWidth = targetSize.width;
     CGFloat targetHeight = targetSize.height;
     
     CGFloat scaleFactor = 0.0;
     CGFloat scaledWidth = targetWidth;
     CGFloat scaledHeight = targetHeight;
     
     CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
     
     if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
          
          CGFloat widthFactor = targetWidth / width;
          CGFloat heightFactor = targetHeight / height;
          
          if (widthFactor < heightFactor)
               scaleFactor = widthFactor;
          else
               scaleFactor = heightFactor;
          
          scaledWidth  = width * scaleFactor;
          scaledHeight = height * scaleFactor;
          
          // center the image
          
          if (widthFactor < heightFactor) {
               thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
          } else if (widthFactor > heightFactor) {
               thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
          }
     }
     
     
     // this is actually the interesting part:
     
     UIGraphicsBeginImageContext(targetSize);
     
     CGRect thumbnailRect = CGRectZero;
     thumbnailRect.origin = thumbnailPoint;
     thumbnailRect.size.width  = scaledWidth;
     thumbnailRect.size.height = scaledHeight;
     
     [sourceImage drawInRect:thumbnailRect];
     
     newImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     if(newImage == nil)
          NSLog(@"could not scale image");
     
     
     return newImage ;
}
- (UIImage *)imageByScalingToSize:(CGSize)targetSize {
     
     UIImage *sourceImage = self;
     UIImage *newImage = nil;
     
     //   CGSize imageSize = sourceImage.size;
     //   CGFloat width = imageSize.width;
     //   CGFloat height = imageSize.height;
     
     CGFloat targetWidth = targetSize.width;
     CGFloat targetHeight = targetSize.height;
     
     //   CGFloat scaleFactor = 0.0;
     CGFloat scaledWidth = targetWidth;
     CGFloat scaledHeight = targetHeight;
     
     CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
     
     // this is actually the interesting part:
     
     UIGraphicsBeginImageContext(targetSize);
     
     CGRect thumbnailRect = CGRectZero;
     thumbnailRect.origin = thumbnailPoint;
     thumbnailRect.size.width  = scaledWidth;
     thumbnailRect.size.height = scaledHeight;
     
     [sourceImage drawInRect:thumbnailRect];
     
     newImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     if(newImage == nil)
          NSLog(@"could not scale image");
     
     
     return newImage ;
}
- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
     return [self imageRotatedByDegrees:RadiansToDegrees(radians)];
}
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
     // calculate the size of the rotated view's containing box for our drawing space
     UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
     CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
     rotatedViewBox.transform = t;
     CGSize rotatedSize = rotatedViewBox.frame.size;
     [rotatedViewBox release];
     
     // Create the bitmap context
     UIGraphicsBeginImageContext(rotatedSize);
     CGContextRef bitmap = UIGraphicsGetCurrentContext();
     
     // Move the origin to the middle of the image so we will rotate and scale around the center.
     CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
     
     //   // Rotate the image context
     CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
     
     // Now, draw the rotated/scaled image into the context
     CGContextScaleCTM(bitmap, 1.0, -1.0);
     CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
     
     UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     return newImage;
}

- (UIImage*)transformWidth:(CGFloat)width
                    height:(CGFloat)height {
     
     CGFloat destW = width;
     CGFloat destH = height;
     CGFloat sourceW = width;
     CGFloat sourceH = height;
     
     CGImageRef imageRef = self.CGImage;
     CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                 destW,
                                                 destH,
                                                 CGImageGetBitsPerComponent(imageRef),
                                                 4*destW,
                                                 CGImageGetColorSpace(imageRef),
                                                 (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
     
     CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
     
     CGImageRef ref = CGBitmapContextCreateImage(bitmap);
     UIImage *result = [UIImage imageWithCGImage:ref];
     CGContextRelease(bitmap);
     CGImageRelease(ref);
     
     return result;
}

+ (UIImage *)imageFromView:(UIView *)theView
{
     // Draw a view’s contents into an image context
     UIGraphicsBeginImageContext(theView.frame.size);
     CGContextRef context = UIGraphicsGetCurrentContext();
     [theView.layer renderInContext:context];
     UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     //保存图片
     //     UIImageWriteToSavedPhotosAlbum(theImage,self,nil,nil);
     //得到截取的图片
     //     NSData *screenshotPNG = UIImagePNGRepresentation(theImage);
     //存储图片命名路径
     //     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     //     NSString *documentsDirectory = [paths objectAtIndex:0];
     //     SGLog(documentsDirectory);
     //     NSError *error = nil;
     //     [screenshotPNG writeToFile:[documentsDirectory stringByAppendingPathComponent:@"screenshot.png"] options:NSAtomicWrite error:&error];
     
     return theImage;
}

+ (UIImage *)imageFromView:(UIView *)theViewOne atFrame:(CGRect)r
{
     UIGraphicsBeginImageContext(theViewOne.frame.size);
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSaveGState(context);
     UIRectClip(r);
     [theViewOne.layer renderInContext:context];
     UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}


+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2
{
     UIGraphicsBeginImageContext(image2.size);
     
     //Draw image2
     [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
     
     //Draw image1
     [image1 drawInRect:CGRectMake(20, 20, image1.size.width, image1.size.height)];
     
     UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
     
     UIGraphicsEndImageContext();
     
     return resultImage;
}


static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight)
{
     float fw, fh;
     if (ovalWidth == 0 || ovalHeight == 0) {
          CGContextAddRect(context, rect);
          return;
     }
     CGContextSaveGState(context);
     CGContextTranslateCTM (context, CGRectGetMinX(rect), CGRectGetMinY(rect));
     CGContextScaleCTM (context, ovalWidth, ovalHeight);
     fw = CGRectGetWidth (rect) / ovalWidth;
     fh = CGRectGetHeight (rect) / ovalHeight;
     CGContextMoveToPoint(context, fw, fh/2);
     CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
     CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
     CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
     CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
     CGContextClosePath(context);
     CGContextRestoreGState(context);
}

+(UIImage *)makeRoundCornerImage : (UIImage*) img : (int) cornerWidth : (int) cornerHeight
{
	UIImage * newImage = nil;
	
	if( nil != img)
	{
		NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
		int w = img.size.width;
		int h = img.size.height;
          
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
          
		CGContextBeginPath(context);
		CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
		addRoundedRectToPath(context, rect, cornerWidth, cornerHeight);
		CGContextClosePath(context);
		CGContextClip(context);
          
		CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
          
		CGImageRef imageMasked = CGBitmapContextCreateImage(context);
		CGContextRelease(context);
		CGColorSpaceRelease(colorSpace);
		[img release];
          
          
		newImage = [[UIImage imageWithCGImage:imageMasked] retain];
		CGImageRelease(imageMasked);
		
		[pool release];
	}
	
     return newImage;
}

@end
