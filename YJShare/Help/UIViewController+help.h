//
//  UIViewController+help.h
//  Draw
//
//  Created by yangjw  on 13-3-22.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface UIViewController (help)

/**
 *  @brief  根据设备类型载入不同的xib文件（例如：iphone5则在nibNameOrNil后添加-iPhone5，ipad则在nibNameOrNil添加-iPad）  目前不同设备xib文件必须为：xxx-iPhone5.xib或xxx-iPad.xib或xxx-iPhone.xib
 *
 *  @param      nibNameOrNil    nib文件名（不带-iPhone5或-iPad或-iPhone）
	@param nibBundleOrNil  可以为nil
	@returns 对象
 */
- (id)initWithNibNameSupport5:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;


/**
 *  @brief  根据设备类型载入不同的xib文件（例如：iphone5则在nibNameOrNil后添加-iPhone5，ipad则在nibNameOrNil添加-iPad）  目前不同设备xib文件必须为：xxx-iPhone5.xib或xxx-iPad.xib或xxx-iPhone.xib
 *
 *  @param      nibNameOrNil    nib文件名（不带-iPhone5或-iPad或-iPhone）
 *
 *  @return                     对象
 *
 */
- (id)createViewControllerByControllerName:(NSString*) nibNameOrNull ;
@end
