//
//  QJNavigationViewController.h
//  JinDaoProject
//
//  Created by QJ on 2016/12/20.
//  Copyright © 2016年 Mr.J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJHeader.h"
#import "QJTools.h"

@interface QJNavigationViewController : UINavigationController

@property (strong, nonatomic)UIView *leftBtnItem;

@property (strong, nonatomic)UIView *rightBtnItem;

@property (strong, nonatomic)UIView *centerView;

@property (strong, nonatomic)UIView * navigationBgView;

- (void)initTitleView:(UIView *)titleView;

- (void)removeTitleView;

-(void)createTitleWithLabel:(UIView*)tView;

-(void)createLeftBtnItemWithCustomView:(UIView*)customView;

-(void)createLeftBtnItem;

-(void)createRightBtnItemWithCustomView:(UIView*)customView;

-(void)createRightBtnItemWithCustomView:(UIView*)customView andFrame:(CGRect)frame;

@end
