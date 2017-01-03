//
//  QJBadgeNumButton.m
//  JinDaoProject
//
//  Created by QJ on 2017/1/1.
//  Copyright © 2017年 Mr.J. All rights reserved.
//

#import "QJBadgeNumButton.h"
#import "NSString+QJ.h"

@implementation QJBadgeNumButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self= [super initWithFrame:frame]) {
        self.hidden = YES;
        self.userInteractionEnabled = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setBackgroundImage:[UIImage imageNamed:@"badge"] forState:UIControlStateNormal];
        
    }
    return self;
}

#pragma mark -重新写数字的setter方法
- (void)setBadgeNum:(NSString *)badgeNum {
    _badgeNum = [badgeNum copy];
    if (badgeNum) {
        self.hidden = NO;
        [self setTitle:badgeNum forState:UIControlStateNormal];
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeNum.length  > 1) {
            CGSize badgeSize = [badgeNum sizeWithFontSize:self.titleLabel.font.pointSize name:self.titleLabel.font.fontName contentSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            badgeW = badgeSize.width +10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
    } else {
        self.hidden = YES;
    }
}

@end
