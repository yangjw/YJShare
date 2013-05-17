//
//  UIColor+Hex.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

/*
 https://github.com/thisandagain/color
 
 */

#import "UIColor+Hex.h"
#import "UIColor+HSB.h"
#import "UIColor+HSL.h"
#import "UIColor+Crayola.h"
#import "UIColor+CIELAB.h"

/* UIColor+Hex
 
 UIColor *green   = [UIColor colorWithHex:0x00FF00];
 UIColor *blue    = [UIColor colorWithHex:0x0000FF andAlpha:0.5f];
 UIColor *gray    = [UIColor colorWithHexString:@"#CCC"];
 */

/*
 UIColor+HSB
 
 UIColor *red     = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
 UIColor *blue    = [red offsetWithHue:-0.56f saturation:0.0f brightness:0.0f alpha:0.0f];
 */

/*
 UIColor+HSL
 
 UIColor *red     = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
 UIColor *pink    = [red offsetWithHue:0.0f saturation:0.0f lightness:0.82f alpha:0.0f];
 */

/*
 UIColor+CIELAB
 
 UIColor *red            = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
 UIColor *brighterRed    = [red offsetWithLightness:15.0f a:0.0f b:0.0f alpha:0.0f];
 */


/*
 UIColor+Crayola
 
 Because crayons are fun! Full list of colors: http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors
 
 UIColor *mint    = [UIColor colorWithCrayola:@"Magic Mint"];
 UIColor *blue    = [UIColor colorWithCrayola:@"Midnight Blue"];
 UIColor *rorange = [UIColor colorWithCrayola:@"Orange Red"];
 */


