//
//  QJTabbarButton.m
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import "QJTabbarButton.h"

// 图标的比例
#define QJTabBarButtonImageRatio 0.6
@interface QJTabbarButton ()

@end

@implementation QJTabbarButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:UIColorFromRGBAx(0.43, 0.43, 0.42, 1.0) forState:UIControlStateNormal];
        [self setTitleColor:UIColorFromRGBAx(0.23, 0.68, 0.95, 1.0) forState:UIControlStateSelected];
        
        QJBadgeNumButton *badgeBtn = [QJBadgeNumButton new];
        badgeBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeBtn];
        self.badgeNumbtn =  badgeBtn;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * QJTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = contentRect.size.height * QJTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item {
    _item = item;
    
    //监听属性的改变 kvo
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

/*
 * 必须手动释放
 */
- (void)dealloc {
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/*
 * 监听到某个对象的属性改变了，就会调用
 *
 * @param keyPath 属性名
 * @param object 哪个对象的属性被改变
 * @param change 属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    //文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    self.badgeNumbtn.badgeNum = self.item.badgeValue;
    
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeNumbtn.frame.size.width - 10;
    CGRect badgeF = self.badgeNumbtn.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeNumbtn.frame = badgeF;
    
}

@end
