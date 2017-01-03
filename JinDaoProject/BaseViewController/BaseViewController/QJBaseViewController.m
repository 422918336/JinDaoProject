//
//  QJBaseViewController.m
//  JinDaoProject
//
//  Created by QJ on 2016/12/20.
//  Copyright © 2016年 Mr.J. All rights reserved.
//

#import "QJBaseViewController.h"

@interface QJBaseViewController ()

@end

@implementation QJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    
    //    self.navigationBar.hidden = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:YES];

    //    shadowImage 是在ios6.0以后才可用的。但是发现5.0也可以用。不过如果你不判断有没有这个方法， 而直接去调用可能会crash，所以判断下。作用：如果你设置了上面那句话，你会发现是透明了。但是会有一个阴影在，下面的方法就是去阴影
    if ([self.navigationController.navigationBar respondsToSelector:@selector(shadowImage)])
    {
        [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    }
    //    以上面4句是必须的,但是习惯还是加了下面这句话
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    
    [self createNavHeadView];

}

- (void)viewWillAppear:(BOOL)animated {
    ((QJTabBarController *)self.tabBarController).navVC.navigationBgView.userInteractionEnabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    ((QJTabBarController *)self.tabBarController).navVC.navigationBgView.userInteractionEnabled = NO;
}

-(void)createNavHeadView{
    
    _bgImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    _bgImgView.image = [UIImage imageNamed:@""];
    [self.view addSubview:_bgImgView];
    
    _nav_left_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 60, 44)];
    _nav_left_btn.tag=1001;
    [_nav_left_btn setBackgroundImage:[UIImage imageNamed:@"ic_richpush_actionbar_back"] forState:UIControlStateNormal];
    [_bgImgView addSubview:_nav_left_btn];
}




#pragma mark NavgationBar setting
-(void)setNavgationBarLeftItem:(NSString*)imageName and:(SEL)action{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    UIButton * iviewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    iviewBtn.frame = CGRectMake(-100, 0, 44, 44);
    
    [iviewBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 11,17, 17)];
    
    if (![@""isEqualToString:imageName]||nil!=imageName) {
        
        [leftButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
    }
    leftButton.adjustsImageWhenHighlighted = NO;//去掉button的点击阴影效果
    
    contentView.userInteractionEnabled = YES;
    
    [contentView addSubview:leftButton];
    
    [contentView addSubview:iviewBtn];
    
    UIBarButtonItem *leftButtonItem=[[UIBarButtonItem alloc]initWithCustomView:contentView];
    
    self.navigationItem.leftBarButtonItem=leftButtonItem;
}
-(void)setRightBarButtonItem:(NSString*)imageName and:(SEL)action andTitle:(NSString*)title{
    if (self.navigationItem.rightBarButtonItem) {
        
        self.navigationItem.rightBarButtonItem = nil;
        
    }
    UIButton * nav_right_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (![@""isEqualToString:imageName]||nil!=imageName) {
        
        [nav_right_btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
    }
    
    [nav_right_btn setTitle:title forState:UIControlStateNormal];
    
    nav_right_btn.frame = CGRectMake(10, 20, 44, 44);
    //nav_right_btn.frame = CGRectMake(10, 0, 21, 21);
    
    [nav_right_btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    nav_right_btn.adjustsImageWhenHighlighted = NO;//去掉button的点击阴影效果
    
    UIBarButtonItem *rightButtonItem=[[UIBarButtonItem alloc]initWithCustomView:nav_right_btn];
    
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
}
-(void)setNavigationBarTitle:(NSString*)title andFont:(UIFont*)font andColor:(UIColor*)color{
    
    self.navigationController.navigationBarHidden = NO;
    
    
    CGSize titleSize = [title sizeWithFontSize:font.pointSize name:font.fontName contentSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    UILabel *customLab;
    if (titleSize.width<200) {
        customLab =[UILabel initLabelWithFrame:CGRectMake(0, 0, titleSize.width, 30) andText:title andFont:font andColor:color];
        [customLab sizeToFit];
    }else{
        customLab =[UILabel initLabelWithFrame:CGRectMake(0, 0, 200, 20) andText:title andFont:font andColor:color];
    }
    customLab.tag = 999;
    customLab.textAlignment = NSTextAlignmentCenter;
    //查询当前房间dnd状态
    //    [(BaseNavigationController*)self.navigationController createTitleWithLabel:customLab];
    [self createTitleWithLabel:customLab];
    
}

-(void)createTitleWithLabel:(UIView*)tView{
    //中间视图
    if (_centerView) {
        [_centerView removeFromSuperview];
    }
    _centerView = [[UIView alloc] initWithFrame:CGRectMake((ScreenWidth-tView.frame.size.width)/2, 33, tView.frame.size.width, 44)];
    _centerView.backgroundColor = [UIColor clearColor];
    UIView *leftNavigationView=((QJNavigationViewController*)self.navigationController).leftBtnItem;
    if (CGRectGetMinX(_centerView.frame)<CGRectGetMaxX(leftNavigationView.frame)) {
        CGRect frame=_centerView.frame;
        frame.origin.x=CGRectGetMaxX(leftNavigationView.frame)+5;
        _centerView.frame=frame;
    }
    [_centerView addSubview:tView];
    [_bgImgView addSubview:_centerView];
    
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
