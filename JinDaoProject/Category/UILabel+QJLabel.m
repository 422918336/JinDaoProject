//
//  UILabel+QJLabel.m
//  JinDaoProject
//
//  Created by QJ on 2017/1/2.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import "UILabel+QJLabel.h"

@implementation UILabel (QJLabel)


+(id)initWithfont:(UIFont *)font
  backgroundColor:(UIColor *)color
             text:(NSString *)text
        textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    if (font) {
        label.font = font;
    }
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.backgroundColor = color;
    if (text) {
        label.text = text;
    }
    label.textColor = textColor;
    return label;
}
+(id)initLabelWithFrame:(CGRect)frame andText:(NSString*)text andFont:(UIFont*)font andColor:(UIColor*)color{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    
    label.text = text;
    
    label.font = font;
    
    label.textColor = color;
    
    return label;
}

@end
