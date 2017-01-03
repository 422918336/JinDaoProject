//
//  QJTabbar.h
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QJTabbar;
@protocol QJTabbarDelegate <NSObject>
@optional
- (void)tabbar:(QJTabbar *)tabbar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
@end


@interface QJTabbar : UIView

- (void)addTabBarButtonItem:(UITabBarItem *)item;
@property (nonatomic, weak) id<QJTabbarDelegate>delegate;
//@property (nonatomic, weak) UIButton *middleBtn;


@end
