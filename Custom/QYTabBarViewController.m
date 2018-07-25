//
//  QYTabBarViewController.m
//  shopProject
//
//  Created by 邱越 on 2018/6/10.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYTabBarViewController.h"
#import "QYNavigationController.h"
#import "QYHomeViewController.h"
#import "QYSearchViewController.h"
#import "QYExplodeViewController.h"
#import "QYMineViewController.h"
#import "AppDelegate.h"
@interface QYTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation QYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewControllers];
    
    self.delegate = self;
}

//添加子控制
-(void)addChildViewControllers{
    
    [self setupTaBarViewController:[[QYNavigationController alloc] initWithRootViewController:[[QYHomeViewController alloc] init]] title:@"首页" image:@"tabBar_essence_icon" seleImage:@"tabBar_essence_click_icon"];
    
    
    [self setupTaBarViewController:[[QYNavigationController alloc] initWithRootViewController:[[QYSearchViewController alloc] init]] title:@"超级搜" image:@"tabBar_new_icon" seleImage:@"tabBar_new_click_icon"];
    
    
    [self setupTaBarViewController:[[QYNavigationController alloc] initWithRootViewController:[[QYExplodeViewController alloc] init]] title:@"爆料" image:@"tabBar_friendTrends_icon" seleImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupTaBarViewController:[[QYNavigationController alloc] initWithRootViewController:[[QYMineViewController alloc] init]] title:@"我的" image:@"tabBar_me_icon" seleImage:@"tabBar_me_click_icon"];
    
    
    
    
}


-(void)setupTaBarViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image seleImage:(NSString *)seleImage{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:seleImage];
    
    [self addChildViewController:vc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
