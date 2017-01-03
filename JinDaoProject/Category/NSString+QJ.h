//
//  NSString+QJ.h
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (QJ)

-(CGSize)size;

-(CGSize)sizeWithFontSize:(CGFloat)size;
 
-(CGSize)sizeWithFontSize:(CGFloat)size name:(NSString*)name contentSize:(CGSize)contentSize;

- (CGSize)heightWithWidth:(CGFloat)width andText:(NSString *)text font:(UIFont *)font;

@end
