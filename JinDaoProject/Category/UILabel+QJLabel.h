//
//  UILabel+QJLabel.h
//  JinDaoProject
//
//  Created by QJ on 2017/1/2.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QJLabel)


+(id)initWithfont:(UIFont *)font
  backgroundColor:(UIColor *)color
             text:(NSString *)text
        textColor:(UIColor *)textColor;

+(id)initLabelWithFrame:(CGRect)frame andText:(NSString*)text andFont:(UIFont*)font andColor:(UIColor*)color;

@end
