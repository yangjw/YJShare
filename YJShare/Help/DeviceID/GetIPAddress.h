//
//  GetIPAddress.h
//  YJShare
//
//  Created by yangjw  on 13-2-25.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//


#define MAXADDRS    32  



extern char *ip_names[MAXADDRS];  


/*
	example:
	#Import "GetIPAddress.h"
	
	use:
		InitAddresses();
		GetIPAddresses();
		GetHWAddresses();
		
		NSLog(@"%s",ip_names[1]);
 
 */

void InitAddresses();  
void GetIPAddresses();  
void GetHWAddresses();  