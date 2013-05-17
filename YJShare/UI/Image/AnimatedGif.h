//
//  AnimatedGif.m
//
//  Created by Stijn Spijker (http://www.stijnspijker.nl/) on 2009-07-03.
//  Based on gifdecode written april 2009 by Martin van Spanje, P-Edge media.
//  

/*
 // First example, a local file
 NSURL 			* firstUrl = 		[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"apple_logo_animated" ofType:@"gif"]];
 UIImageView 	* firstAnimation = 	[AnimatedGif getAnimationForGifAtUrl: firstUrl];
 
 // Second example, through HTTP
 NSURL 		* secondUrl = 			[NSURL URLWithString:@"http://www.gifs.net/Animation11/Food_and_Drinks/Fruits/Apple_jumps.gif"];
 UIImageView * secondAnimation = 	[AnimatedGif getAnimationForGifAtUrl: secondUrl];
 
 remoteAnimationView = [secondAnimation retain];
 
 // Add them to the view.
 [theFirstAnimatedGif addSubview:firstAnimation];
 [theSecondAnimatedGif addSubview:secondAnimation];

*/

#ifdef TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif 	

@interface AnimatedGifFrame : NSObject
{
	NSData *data;
	NSData *header;
	double delay;
	int disposalMethod;
	CGRect area;
}

@property (nonatomic, copy) NSData *header;
@property (nonatomic, copy) NSData *data;
@property (nonatomic) double delay;
@property (nonatomic) int disposalMethod;
@property (nonatomic) CGRect area;

@end

@interface AnimatedGifQueueObject : NSObject
{
    UIImageView *uiv;
    NSURL *url;
}

@property (nonatomic, retain) UIImageView *uiv;
@property (nonatomic, retain) NSURL *url;

@end


@interface AnimatedGif : NSObject
{
	NSData *GIF_pointer;
	NSMutableData *GIF_buffer;
	NSMutableData *GIF_screen;
	NSMutableData *GIF_global;
	NSMutableArray *GIF_frames;

    NSMutableArray *imageQueue;
	bool busyDecoding;
	
	int GIF_sorted;
	int GIF_colorS;
	int GIF_colorC;
	int GIF_colorF;
	int animatedGifDelay;
	
	int dataPointer;
    
    UIImageView *imageView;
}

@property (nonatomic, retain) UIImageView* imageView;
@property bool busyDecoding;

- (void) addToQueue: (AnimatedGifQueueObject *) agqo;
+ (UIImageView*) getAnimationForGifAtUrl: (NSURL *) animationUrl;
- (void) decodeGIF:(NSData *)GIF_Data;
- (void) GIFReadExtensions;
- (void) GIFReadDescriptor;
- (bool) GIFGetBytes:(int)length;
- (bool) GIFSkipBytes: (int) length;
- (NSData*) getFrameAsDataAtIndex:(int)index;
- (UIImage*) getFrameAsImageAtIndex:(int)index;
- (UIImageView*) getAnimation;

@end
