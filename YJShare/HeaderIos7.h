//
//  HeaderIos7.h
//  YJShare
//
//  Created by yangjw  on 14-1-23.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#ifndef YJShare_HeaderIos7_h
#define YJShare_HeaderIos7_h



//目的：用于iOS7和iOS6适配，和保留之前的坐标编码习惯，不用刻意加减

/*方法1：
 *1。在vc中重写viewDidLayoutSubviews方法
 *2。是用下面2个方法之一；
 *3。frame为ios6风格，状态栏和导航栏为平铺
 *4。bounds为ios7风格，状态栏和导航栏为覆盖
 *5。优点，所有subview的坐标都一ios6的标准进行编写，支持push和present
 *6。缺点，在push中每个vc都需要重写viewDidLayoutSubviews方法；
 */
void IOS7ToIOS6ofFrame(UIViewController *vc);
void IOS7ToIOS6ofBounds(UIViewController *vc);

void IOS7ToIOS6ofFrame(UIViewController *vc)
{
    if (IsIOS7) {
        CGRect rect = vc.view.frame;
        vc.view.frame = CGRectMake((rect.origin.x), (rect.origin.y+(IsIOS7?vc.topLayoutGuide.length:0)), (CGRectGetWidth(rect)), (CGRectGetHeight(rect)-(IsIOS7?vc.topLayoutGuide.length:0)));
    }
}

void IOS7ToIOS6ofBounds(UIViewController *vc)
{
    if (IsIOS7) {
        CGRect rect = vc.view.bounds;
        if (rect.origin.y != -1*vc.topLayoutGuide.length) {
            vc.view.bounds = CGRectMake((rect.origin.x), (rect.origin.y+(IsIOS7?vc.topLayoutGuide.length*(-1):0)), (CGRectGetWidth(rect)), (CGRectGetHeight(rect)));
        }
    }
}

/*方法2:
 *1.在vc的init或viewdidload中使用IOS7宏即可；
 *2.状态栏和导航栏为平铺
 *3.优点：所有subview的坐标都一ios6的标准进行编写，支持push，背景frame值同ios6
 *4.缺点：在push中每个vc都需要写，不支持present；
 */

#define IOS7 if([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)\
{self.extendedLayoutIncludesOpaqueBars = NO;\
self.modalPresentationCapturesStatusBarAppearance =NO;\
self.edgesForExtendedLayout = UIRectEdgeNone;}

/*方法3:
 *1.使用self.navigationController.navigationBar.translucent =NO;
 *2.状态栏和导航栏为平铺
 *3.优点：所有subview的坐标都一ios6的标准进行编写，支持push，背景frame值同ios6，只需要设置一次
 *4.缺点：必须有nav；对于present的vc必须为nav
 */

/*方法4:
 *1.重新定义CGRECT;
 *2.状态栏和导航栏为覆盖
 *3.优点：随时可以用
 */
#define IsIOS7 ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))

#endif
