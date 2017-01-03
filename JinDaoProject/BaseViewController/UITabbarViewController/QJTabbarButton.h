//
//  QJTabbarButton.h
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJBadgeNumButton.h"
#import "QJHeader.h"

@interface QJTabbarButton : UIButton

@property (nonatomic,strong) UITabBarItem *item;
@property (nonatomic,strong) QJBadgeNumButton *badgeNumbtn;

@end
