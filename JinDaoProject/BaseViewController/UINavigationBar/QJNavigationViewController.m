//
//  QJNavigationViewController.m
//  JinDaoProject
//
//  Created by QJ on 2016/12/20.
//  Copyright © 2016年 Mr.J. All rights reserved.
//

#import "QJNavigationViewController.h"
#import "AppDelegate.h"

@interface QJNavigationViewController ()
{
    UIView *_textView;

}
@end

@implementation QJNavigationViewController

@synthesize navigationBgView,leftBtnItem,rightBtnItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    
}

- (void)initViews {
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    //背景
    navigationBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 44)];
    
    navigationBgView.backgroundColor = [UIColor clearColor];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    self.navigationBar.hidden = YES;
    
    [self.view addSubview:navigationBgView];

}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    
//}



-(void)createTitleWithLabel:(UIView*)tView{
    //中间视图
    if (_centerView) {
        [_centerView removeFromSuperview];
    }
    _centerView = [[UIView alloc] initWithFrame:CGRectMake((ScreenWidth-tView.frame.size.width)/2, 8, tView.frame.size.width, 44)];
    _centerView.backgroundColor = [UIColor clearColor];
    [_centerView addSubview:tView];
    [navigationBgView addSubview:_centerView];
    navigationBgView.hidden = NO;
    //    [self initTitleView:tView];
}
//自定义导航栏
-(void)createLeftBtnItemWithCustomView:(UIView*)customView{
    if (leftBtnItem) {
        [leftBtnItem removeFromSuperview];
    }
    //定制左右按钮
    leftBtnItem = [[UIView alloc]initWithFrame:customView.bounds];
    
    leftBtnItem.userInteractionEnabled = YES;
    
    [self.leftBtnItem addSubview:customView];
    
    self.leftBtnItem.userInteractionEnabled = YES;
    
    [navigationBgView addSubview:self.leftBtnItem];
}
//导航栏自带返回
-(void)createLeftBtnItem{
    
    if (leftBtnItem) {
        
        [leftBtnItem removeFromSuperview];
    }
    //定制左右按钮
    leftBtnItem = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    
    leftBtnItem.userInteractionEnabled = YES;
    leftBtnItem.tag = 999;
    UIButton * nav_left_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    
    //    [nav_left_btn setBackgroundImage:[UIImage imageNamed:@"btn_back_default.png"] forState:UIControlStateNormal];
    
    [nav_left_btn setBackgroundImage:[UIImage imageNamed:@"ic_richpush_actionbar_back"] forState:UIControlStateHighlighted];
    
    [nav_left_btn addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.leftBtnItem addSubview:nav_left_btn];
    
    [navigationBgView addSubview:self.leftBtnItem];
    
}
-(void)createRightBtnItemWithCustomView:(UIView*)customView{
    
    [self createRightBtnItemWithCustomView:customView andFrame:CGRectMake(ScreenWidth - 60, 0, 60, 44)];
}

-(void)createRightBtnItemWithCustomView:(UIView*)customView andFrame:(CGRect)frame{
    if (rightBtnItem) {
        [rightBtnItem removeFromSuperview];
    }
    rightBtnItem =[[UIView alloc]initWithFrame:frame];
    
    rightBtnItem.userInteractionEnabled = YES;
    
    [self.rightBtnItem addSubview:customView];
    
    [navigationBgView addSubview:self.rightBtnItem];
    
    ((QJNavigationViewController*)self.navigationController).rightBtnItem.hidden = NO;
}


- (void)leftAction:(UIButton *)btn
{
    //    if (rightBtnItem.userInteractionEnabled) {
    //        rightBtnItem.userInteractionEnabled  = NO;
//    if ([self.baseNavDelegate respondsToSelector:@selector(goBackListener)])
//    {
//        [self.baseNavDelegate goBackListener];
//        rightBtnItem.userInteractionEnabled  = YES;
//    }
//    else
//    {
//        AppDelegate * delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
//        [delegate.navigationC popViewControllerAnimated:YES];
//        rightBtnItem.userInteractionEnabled  = YES;
//        
//    }
    //    }
}


#pragma mark - 模仿push pop效果
- (void)initTitleView:(UIView *)titleView
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.35f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    
    [_centerView.layer addAnimation:transition forKey:nil];
    [_centerView addSubview:titleView];
    _textView = titleView;
}

- (void)removeTitleView
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.35f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.delegate = self;
    
    [_centerView.layer addAnimation:transition forKey:nil];
    [_textView removeFromSuperview];
}


////////////////////////////////////////////////////////////////////////////////////

#pragma mark - UINavigationControllerDelegate

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // self - 导航控制器
    if (self.viewControllers.count) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -5;
        
        //设置导航栏的按钮
        UIBarButtonItem *backButton = [UIBarButtonItem itemWithImageName:@"navigationButtonReturn" highImageName:@"navigationButtonReturn" target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
        
        // 就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;

    }
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.topViewController.navigationItem.backBarButtonItem = backItem;
    
    // 调用系统默认做法,因为只有系统才知道怎么做push
    [super pushViewController:viewController animated:animated];
}


- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    self.leftBtnItem.userInteractionEnabled = YES;
    self.rightBtnItem.userInteractionEnabled = YES;
    
    
    //    if ([viewController isKindOfClass:[SHMainViewController class]]||[viewController isKindOfClass:[MainController class]]||[viewController isKindOfClass:[GuideViewController class]]||[viewController isKindOfClass:[LoginViewController class]]||[viewController isKindOfClass:[SafePInViewController class]]) {
    //
    //        self.interactivePopGestureRecognizer.enabled = NO;
    //
    //    }else{
    //
    //        self.interactivePopGestureRecognizer.enabled = YES;
    //
    //    }
    self.interactivePopGestureRecognizer.enabled = YES;
    
    NSLog(@"%d",self.interactivePopGestureRecognizer.enabled);
    
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.leftBtnItem.userInteractionEnabled = NO;
    self.rightBtnItem.userInteractionEnabled = NO;
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)back {
    [self popViewControllerAnimated:YES];
}





//+ (void)initialize {
//    [self setNavBar];
//}
///**
// *  设置导航栏
// */
//+ (void)setNavBar {
//    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
//    // 设置tabBarItem的颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//}



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
