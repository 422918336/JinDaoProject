//
//  QJTools.m
//  JinDaoProject
//
//  Created by QJ on 2017/1/2.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import "QJTools.h"

@implementation QJTools

UIImage *imageFromColor(UIColor *color) {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
