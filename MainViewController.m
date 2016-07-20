//
//  MainViewController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "MainViewController.h"
#import "YTNavigationController.h"
#import "YTViewAController.h"
#import "YTViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    JTViewController *firstVC = [[JTViewController alloc] init];
//    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
//    firstVC.tabBarItem = firstItem;
//    JTNavigationController *firstNav = [[JTNavigationController alloc] initWithRootViewController:firstVC];
//    firstNav.tabBarItem.title = @"测试";
//    //给 taBarItem 设置图片
//    firstNav.tabBarItem.image = [UIImage imageNamed:@"class_nor"];
//    //设置选中状态的图片
//    firstNav.tabBarItem.selectedImage =[[UIImage imageNamed:@"calss"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    self.viewControllers = @[firstNav];
//    self.tabBarController.tabBar.translucent = YES;
//    
//    
//    
//    YTViewController *secVC = [[YTViewController alloc] init];
//    UITabBarItem *secItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
//    secVC.tabBarItem = secItem;
//    JTNavigationController *secNav = [[JTNavigationController alloc] initWithRootViewController:secVC];
//    secNav.tabBarItem.title = @"测试1";
//    //给 taBarItem 设置图片
//    secNav.tabBarItem.image = [UIImage imageNamed:@"exercise_nor"];
//    //设置选中状态的图片
//    secNav.tabBarItem.selectedImage =[[UIImage imageNamed:@"exercise"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    self.viewControllers = @[firstNav,secNav];
//    self.tabBarController.tabBar.translucent = YES;
    
    
    
    YTViewAController *view1 = [YTViewAController new];
    YTNavigationController *navigation1 =[[YTNavigationController alloc] initWithRootViewController:view1];
    //给 taBarItem 设置图片
    navigation1.tabBarItem.image = [UIImage imageNamed:@"class_nor"];
    //设置选中状态的图片
    navigation1.tabBarItem.selectedImage =[[UIImage imageNamed:@"calss"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigation1.tabBarItem.title = @"ViewA";
    
    YTViewController *view2 = [YTViewController new];
    YTNavigationController *navigation2 =[[YTNavigationController alloc] initWithRootViewController:view2];
    //给 taBarItem 设置图片
    navigation2.tabBarItem.image = [UIImage imageNamed:@"exercise_nor"];
    //设置选中状态的图片
    navigation2.tabBarItem.selectedImage =[[UIImage imageNamed:@"exercise"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigation2.tabBarItem.title = @"ViewB";
    
    //视图控制器容器 分栏控制器
    UITabBarController *tabBarController =[[UITabBarController alloc] init];
    //把5个视图控制器装到分栏控制器里边
    self.viewControllers = @[navigation1,navigation2];
    //设置隐藏全局 tabbar
    tabBarController.tabBar.hidden =NO;
    
    
}

@end
