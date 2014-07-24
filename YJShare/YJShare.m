//
//  YJShare.m
//  YJShare
//
//  Created by yangjw  on 13-2-25.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import "YJShare.h"
#import <QuartzCore/QuartzCore.h>

@interface YJShare ()
{
	
}

@end

@implementation YJShare

#pragma mark 检测版本
NSUInteger DeviceSystemMajorVersion() {
	static NSUInteger _deviceSystemMajorVersion = -1;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
	});
	return _deviceSystemMajorVersion;
}




#pragma mark 号码过滤
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
	
	int length = [self getLength:textField.text];
	//NSLog(@"Length  =  %d ",length);
	
	if(length == 10)
	{
		if(range.length == 0)
			return NO;
	}
	
	if(length == 3)
	{
		NSString *num = [self formatNumber:textField.text];
		textField.text = [NSString stringWithFormat:@"(%@) ",num];
		if(range.length > 0)
			textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
	}
	else if(length == 6)
	{
		NSString *num = [self formatNumber:textField.text];
		//NSLog(@"%@",[num  substringToIndex:3]);
		//NSLog(@"%@",[num substringFromIndex:3]);
		textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
		if(range.length > 0)
			textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
	}
	
	return YES;
	
	
	
	//	self.messageArray = @[@"北京时间10月30日，新赛季NBA常规赛拉开帷幕，首日焦点战中，热火迎来新赛季开门红，主场107：95战胜公牛。本场赛前，热火队还升起上赛季总冠军旗并领取总冠军戒指",@"95战胜公牛。本场赛前，热火队还升起上赛季总冠军旗并领取总冠军戒指。NBA是世界最高水平的篮球赛事。NBA常规赛采用主、客场制，30支球队在常规赛赛季共要进行1230场比赛，每个球队参加82场比赛。",@"北京时间10月30日，新赛季NBA常规赛拉开帷幕，首日焦点战中，热火迎来新赛季开门红，主场107：95战胜公牛。本场赛前，热火队还升起上赛季总冠军旗并领取总冠军戒指。NBA是世界最高水平的篮球赛事。NBA常规赛采用主、客场制，30支球队在常规赛赛季共要进行1230场比赛，每个球队参加82场比赛。",@"每个球队参加82场比赛。",@"新赛季NBA常规赛拉开帷幕，首日焦点战中，热火迎来新赛季开门红，主场107：95战胜公牛。本场赛前，热火队还升起上赛季总冠军旗并领取总冠军戒指。NBA是世界最高水平的篮球赛事。NBA常规赛采用主、客场制，30支球队在常规赛赛季共要进行1230场比赛，每个球队参加82场比赛。"];
	//	for (int i = 0; i < [self.messageArray count]; i++)
	//	{
	//		UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]; // 这个大小可以随便写,反正后面会改变他
	//		label.font = [UIFont systemFontOfSize:10];//这个也随便设, 任何字体都会自动计算出 合适的大小
	//		label.text = [self.messageArray objectAtIndex:i]; //label.text = @"1234";
	//		label.numberOfLines = 0;//这个一定要设成0
	//		CGSize ssize = [label sizeThatFits:CGSizeMake(260, 0)];
	//		CGRect rct = label.frame;
	//		rct.size = ssize;
	//		label.frame = rct;
	//		NSLog(@"=========%f",label.size.height);
	//		[heightArray addObject:[NSString stringWithFormat:@"%f",label.size.height]];
	//	}
}

-(NSString*)formatNumber:(NSString*)mobileNumber
{
	
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
	
	NSLog(@"%@", mobileNumber);
	
	int length = [mobileNumber length];
	if(length > 10)
	{
		mobileNumber = [mobileNumber substringFromIndex: length-10];
		NSLog(@"%@", mobileNumber);
		
	}
	
	
	return mobileNumber;
}


-(int)getLength:(NSString*)mobileNumber
{
	
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
	mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
	
	int length = [mobileNumber length];
	
	return length;
	
	
}


/*邮箱验证 MODIFIED BY HELENSONG*/
-(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/*手机号码验证 MODIFIED BY HELENSONG*/
-(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
	//    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

/*车牌号验证 MODIFIED BY HELENSONG*/
BOOL validateCarNo(NSString* carNo)
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}

//自动适配文字高度
- (void) labelAutoHeight:(UILabel *) contentLabel text:(NSString *) text {
    
    UIFont *font = [UIFont systemFontOfSize:12];
    contentLabel.font = font;
    [contentLabel setNumberOfLines:0];
    contentLabel.lineBreakMode = UILineBreakModeWordWrap;
    contentLabel.backgroundColor = [UIColor greenColor];
    contentLabel.tag = 102;
    CGSize size = CGSizeMake(320,2000);
    CGSize labelsize = [text sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    [contentLabel setFrame:CGRectMake(20, 30, 320, labelsize.height)];
}
//判读是否都是数字
- (BOOL)isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark 捕捉屏幕截图
+ (UIImage *) imageFromView: (UIView *) theView
{
    // Draw a view’s contents into an image context
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


-(BOOL)isNull:(id)object
{
    // 判断是否为空串
    if ([object isEqual:[NSNull null]]) {
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return NO;
    }
    else if (object==nil){
        return NO;
    }
    return YES;
}

-(NSString*)convertNull:(id)object{
	
    // 转换空串
	
    if ([object isEqual:[NSNull null]]) {
        return @" ";
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return @" ";
    }
    else if (object==nil){
        return @"无";
    }
    return object;
    
}

//一个字符串 是否包含另外一个字符串

+(BOOL)stringContentString:(NSString *)motherString subString:(NSString *)sonString{
    if ([motherString rangeOfString:sonString].location!=NSNotFound) {
		
        return YES;
    }else {
        return NO;
    }

}


//通过经纬度计算两个之间的距离
+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2{
    double dd = M_PI/180;
    double x1=lat1*dd,x2=lat2*dd;
    double y1=lng1*dd,y2=lng2*dd;
    double R = 6371004;
    double distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    //km  返回
    //     return  distance*1000;
	
    //返回 m
    return   distance;
	
}


//+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2{
//    CLLocation* curLocation = [[CLLocation alloc] initWithLatitude:lat1 longitude:lng1];
//    CLLocation* otherLocation = [[CLLocation alloc] initWithLatitude:lat2 longitude:lng2];
//	double distance  = [curLocation distanceFromLocation:otherLocation];
//    return distance;
//}


//iOS 6 UIRefreshControl
//UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
//refresh.tintColor = [UIColor lightGrayColor];
//refresh.attributedTitle = [[[NSAttributedString alloc] initWithString:@"Pull to Refresh"] autorelease];
//[refresh addTarget:self action:@selector(refreshView:) forControlEvents:响应事件];
//table的viewcontrol.refreshControl = refresh;
//[refresh release];


/**< 自定义queue，默认串行： NULL == DISPATCH_QUEUE_SERIAL*/
/**< label:标签，用于标注queue*/
//    dispatch_queue_t queue = dispatch_queue_create("label", NULL);
//
//    dispatch_async(queue, ^{
//        NSLog(@"test");
//    });

/**< 自定义queue，并行： DISPATCH_QUEUE_SERIAL*/
//    dispatch_queue_t serial_queue = dispatch_queue_create("标签", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(serial_queue, ^(){
//        sleep(5);
//        NSLog(@"block_1"); // 尽管为异步调用且延迟3秒，但由于在serial队列中，block_1仍然先于block_2被打印出来
//    });
//    dispatch_async(serial_queue, ^(){
//        NSLog(@"block_2");
//    });

/**< 延迟执行*/
/**< (int64_t)(delayInSeconds * NSEC_PER_SEC)：转换成毫秒*/
//    double delayInSeconds = 5.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        NSLog(@"5s delay");
//    });

/**< 常用的异步并发执行*/
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0), ^{
//        sleep(5);
//        NSLog(@"block_1");
//    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0), ^{
//        NSLog(@"block_2");
//    });

/**< 异步并回调主线程，常用ui更新*/
/*
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0), ^{
	dispatch_async(dispatch_get_main_queue(), ^{
		NSLog(@"to do with ui");
		
	});
});
*/
@end
