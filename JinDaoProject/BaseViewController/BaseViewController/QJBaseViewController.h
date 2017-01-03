//
//  QJBaseViewController.h
//  JinDaoProject
//
//  Created by QJ on 2016/12/20.
//  Copyright © 2016年 Mr.J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJTools.h"
#import "AppDelegate.h"
#import "NSString+QJ.h"
#import "UILabel+QJLabel.h"
#import "QJTabBarController.h"

@interface QJBaseViewController : UIViewController


@property (nonatomic,strong)UIView * centerView;                //Title按钮
@property (nonatomic,strong)UIButton * nav_left_btn;            //左边返回按钮图片
@property (nonatomic,strong)UIImageView * bgImgView;




#pragma mark NavgationBar setting

-(void)setNavgationBarLeftItem:(NSString*)imageName and:(SEL)action;

-(void)setRightBarButtonItem:(NSString*)imageName and:(SEL)action andTitle:(NSString*)title;

-(void)setNavigationBarTitle:(NSString*)title andFont:(UIFont*)font andColor:(UIColor*)color;

-(void)createTitleWithLabel:(UIView*)tView;

@end
