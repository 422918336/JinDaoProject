//
//  QJTabbar.m
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import "QJTabbar.h"
#import "QJTabbarButton.h"

@interface QJTabbar ()
@property (nonatomic,strong) NSMutableArray *tabBarBtns;
@property (nonatomic,weak) QJTabbarButton *selectedBtn;
@end

@implementation QJTabbar

#pragma mark - lazyload
- (NSMutableArray *)tabBarBtns {
    if (!_tabBarBtns) {
        _tabBarBtns = [[NSMutableArray alloc]init];
    }
    return _tabBarBtns;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        
//        // 添加中间的按钮
//        UIButton *midBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [midBtn setBackgroundImage:[UIImage imageNamed:@"首页_写鸡毛信"] forState:UIControlStateNormal];
//        midBtn.bounds = CGRectMake(0, 0, midBtn.currentBackgroundImage.size.width, midBtn.currentBackgroundImage.size.height);
//        [self addSubview:midBtn];
//        self.middleBtn = midBtn;
    }
    return self;
}

- (void)addTabBarButtonItem:(UITabBarItem *)item {
    QJTabbarButton *btn = [QJTabbarButton new];
    [self addSubview:btn];
    [self.tabBarBtns addObject:btn];
    
    btn.item = item;
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    if (self.tabBarBtns.count == 1) {
        [self btnClicked:btn];
    }
    
}

- (void)btnClicked:(QJTabbarButton *)btn {
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabbar:self didSelectedButtonFrom:self.selectedBtn.tag to:btn.tag];
    }
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
//    self.middleBtn.center = CGPointMake(w * 0.5, h * 0.5);
    
    CGFloat btnH = h;
    CGFloat btnW = w/self.subviews.count;
    CGFloat btnY = 0;
    for (NSInteger index=0; index < self.tabBarBtns.count; index ++) {
        QJTabbarButton *btn = [self.tabBarBtns objectAtIndex:index];
        CGFloat btnX = index *btnW;
        
//        if (index > 1) {
//            btnX += btnW;
//        }
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = index;
    }
}

@end
