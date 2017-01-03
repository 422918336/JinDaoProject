//
//  NSString+QJ.m
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import "NSString+QJ.h"

@implementation NSString (QJ)

-(CGSize)size{
    return [self sizeWithFontSize:[UIFont systemFontSize]];
}

-(CGSize)sizeWithFontSize:(CGFloat)size
{
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:size],NSKernAttributeName:@(0.2f)};
    CGSize fontSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return fontSize;
}


-(CGSize)sizeWithFontSize:(CGFloat)size name:(NSString*)name contentSize:(CGSize)contentSize
{
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont fontWithName:name size:size],NSKernAttributeName:@(0.2f)};
    CGSize fontSize = [self boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return fontSize;
}

- (CGSize)heightWithWidth:(CGFloat)width andText:(NSString *)text font:(UIFont *)font
{
    if (!text.length) {
        return CGSizeMake(0, 0);
    }
    
    if([[UIDevice currentDevice].systemVersion floatValue] < 7.0){
#pragma clang diagnostic ignored "-Wdeprecated"
        CGSize size = [text sizeWithFont:font
                       constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                           lineBreakMode:NSLineBreakByWordWrapping];
        return size;
        
    }else{
        
        CGSize size = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                         options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil].size;
        return size;
    }
    
    return CGSizeMake(0,0);
}

@end
