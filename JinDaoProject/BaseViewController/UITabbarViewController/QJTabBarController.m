//
//  QJTabBarController.m
//  JinDaoProject
//
//  Created by QJ on 2016/12/20.
//  Copyright © 2016年 Mr.J. All rights reserved.
//

#import "QJTabBarController.h"
#import "QJTabbar.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThiedViewController.h"
#import "ForthViewController.h"

@interface QJTabBarController ()<QJTabbarDelegate>
@property (nonatomic,weak) QJTabbar *customTabbar;
@end

@implementation QJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self  setTabbar];
    [self setupAllChildViewControllers];
//    [self.customTabBar.middleBtn addTarget:self action:@selector(midBtn) forControlEvents:UIControlEventTouchUpInside];
}

// 中间按钮的点击方法
//- (void)midBtn {
//    NSLog(@"你点我干嘛呢？啊啊啊");
//}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)setTabbar {
    QJTabbar *customTabBar = [QJTabbar new];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabbar = customTabBar;
}

- (void)tabbar:(QJTabbar *)tabbar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}

- (void)setupAllChildViewControllers {
    
    FirstViewController *firstVC = [FirstViewController new];
    SecondViewController *secondVC = [SecondViewController new];
    ThiedViewController *thirdVC = [ThiedViewController new];
//    ForthViewController *forthVC = [ForthViewController new];
    [self setupChildViewController:firstVC title:@"首页" imageName:@"jdapp_item1" selectedImageName:@"jdapp_item1_active"];
    [self setupChildViewController:secondVC title:@"附近" imageName:@"jdapp_item2" selectedImageName:@"jdapp_item2_active"];
    [self setupChildViewController:thirdVC title:@"我的" imageName:@"jdapp_item3" selectedImageName:@"jdapp_item3_active"];
//    [self setupChildViewController:forthVC title:@"第四个啦" imageName:@"jdapp_item1" selectedImageName:@"jdapp_item1_active"];
    
}

- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    childVC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    self.navVC = [[QJNavigationViewController alloc]initWithRootViewController:childVC];
    [self addChildViewController:self.navVC];
    [self.customTabbar addTabBarButtonItem:childVC.tabBarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
