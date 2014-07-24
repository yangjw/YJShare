//
//  UIImage+Help.h
//  Example
//
//  Created by yangjw  on 12-11-7.
//  Copyright (c) 2012年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (Help)
//图片放置位置 UIImage *imageRend = [ UIImage imageNamed:@"trend.png"];
//CGRect frame=CGRectMake(10,10,100,100);
//     imageRend = [ imageRend imageAtRect:frame];
- (UIImage *)imageAtRect:(CGRect)rect;
//图像的缩放比例最小大小
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
//缩放比例大小
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
//缩放
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
//旋转角度
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
//旋转宽度和高度
- (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height;

//Example保存图片
//  UIImage *grabImg = [ImageProcess grabImageWithView:postcard_FrontView scale:1];//正面截图
//  NSData *imgData  = UIImagePNGRepresentation(grabImg);
//  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//  NSString *documentsDirectory = [paths objectAtIndex:0];
//  SGLog(documentsDirectory);
//  NSError *error = nil;
//  [screenshotPNG writeToFile:[documentsDirectory stringByAppendingPathComponent:@"screenshot.png"] options:NSAtomicWrite error:&error];

//保存图像
//NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"/%d.png",index];
//if ([UIImagePNGRepresentation(image) writeToFile:path atomically:YES]) {
//     index += 1;
//     NSLog(@"Succeeded! %@",path);
//}
//else
//{
//NSLog(@"Failed!");
//}

//截图View
+ (UIImage *) imageFromView: (UIView *) theView;
//截图指定区域
+ (UIImage *)imageFromView: (UIView *) theViewOne atFrame:(CGRect)r;
//图片合并
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;

//     UIImage *imageRend = [ UIImage imageNamed:@"trend.png"];
//imageRend = [ImageManipulator makeRoundCornerImage:imageRend : 20 : 20];
//圆角图片
+(UIImage *)makeRoundCornerImage:(UIImage*)img :(int) cornerWidth :(int) cornerHeight;
@end
