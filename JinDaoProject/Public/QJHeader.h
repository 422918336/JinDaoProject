//
//  Header.h
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

//#ifndef Header_h
//#define Header_h54
//
//
//#endif /* Header_h */
//



#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "QJHeader.h"
#endif

#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define ScreenWidth  ([UIScreen mainScreen].bounds.size.width)

#define APPVersions [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]

#define DEVICE_IS_IPHONES [[[UIDevice currentDevice] systemVersion] floatValue]
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height != 480.0)
#define DEVICE_IS_IPHONE5_WIDTH ([[UIScreen mainScreen] bounds].size.width == 320.0)
#define DEVICE_IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667.0)
#define DEVICE_IS_IPHONE6Plus ([[UIScreen mainScreen] bounds].size.height == 736.0)

#define iOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define CellLineColor [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1]


#ifndef DEBUG
#define MODE 1
#else
#define MODE 0
#endif

#if MODE == 1 
    #define APPRequestMethod @"http://"
    #define RequestServerIndexMethod @"123.207.137.67/"
    #define RequestServerIndexParams @"Ws/"
#else
    #define APPRequestMethod @"http://"
    #define RequestServerIndexMethod @"123.207.137.67/"
    #define RequestServerIndexParams @"Ws/"
#endif

#define APPSTOREServer @"https://itunes.apple.com/"

#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/225.0f green:g/225.0f blue:b/225.0f alpha:a]
#define UIColorFromRGB(r,g,b) UIColorFromRGBA(r,g,b,1.0f)
#define UIColorFromRGBAx(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]


#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s",__func__)
#define NSDLog(fmt, ...) NSLog((@"%s:%d " fmt),__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)









