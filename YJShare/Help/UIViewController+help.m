//
//  UIViewController+help.m
//  Draw
//
//  Created by yangjw  on 13-3-22.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import "UIViewController+help.h"

@implementation UIViewController (help)

- (id)initWithNibNameSupport5:(NSString *)nibNameOrNull bundle:bundle {
     
     NSString *myNibName;
     CGRect screenBounds = [[UIScreen mainScreen] bounds];
     if (isPad)
     {
          myNibName = [NSString stringWithFormat:@"%@-ipad",nibNameOrNull];
     }else
          {
          if (screenBounds.size.height == 568) {
               // code for 4-inch screen
               myNibName = [NSString stringWithFormat:@"%@-iphone5",nibNameOrNull];
               
          } else {
               // code for 3.5-inch screen
               myNibName = [NSString stringWithFormat:@"%@-iphone",nibNameOrNull];
          }
     }
     if ((self = [self initWithNibName:myNibName bundle: bundle]))
     {
          // Custom initialization
     }
     
     return self;
}

- (id)createViewControllerByControllerName:(NSString*) nibNameOrNull {
     if (nibNameOrNull == nil || [nibNameOrNull isEqualToString:@""]) {
          return nil;
     }
     NSString *controllerXibName = nil;
     CGRect screenBounds = [[UIScreen mainScreen] bounds];
     if (isPad)
     {
          controllerXibName = [NSString stringWithFormat:@"%@-ipad",nibNameOrNull];
     }else
     {
          if (screenBounds.size.height == 568) {
               // code for 4-inch screen
               controllerXibName = [NSString stringWithFormat:@"%@-iphone5",nibNameOrNull];
               
          } else {
               // code for 3.5-inch screen
               controllerXibName = [NSString stringWithFormat:@"%@-iphone",nibNameOrNull];
          }
     }
     Class class = NSClassFromString(controllerXibName);
     return  [[[class alloc] initWithNibName:controllerXibName bundle:nil] autorelease];
//     if (self == [self initWithNibName:controllerXibName bundle:nil]) {
//          
//     }
//     return self;
}
@end
