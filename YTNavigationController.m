//
//  JTNavigationController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "YTNavigationController.h"
#import "YTBaseNavigationController.h"



#pragma mark - YTWrapNavigationController

@implementation YTWrapNavigationController

- (NSArray<UIViewController *> *)rootViewControllers {
    NSMutableArray<UIViewController *> *rootViewControllers = [NSMutableArray array];
    for (UIViewController *viewControllers in [YTBaseNavigationController shareNavgationController].viewControllers) {
        UINavigationController *wrapNavController = viewControllers.childViewControllers.firstObject;
        [rootViewControllers addObject:wrapNavController.viewControllers.firstObject];
    }
    return rootViewControllers.copy;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [[YTBaseNavigationController shareNavgationController] popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
   return [[YTBaseNavigationController shareNavgationController] popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSInteger index = [[self rootViewControllers] indexOfObject:viewController];
    return [[YTBaseNavigationController shareNavgationController] popToViewController:[YTBaseNavigationController shareNavgationController].viewControllers[index] animated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:kDefaultBackImageName] style:UIBarButtonItemStylePlain target:self action:@selector(didTapBackButton)];
    [[YTBaseNavigationController shareNavgationController] pushViewController:[YTWrapViewController wrapViewControllerWithViewController:viewController] animated:animated];
}

- (void)didTapBackButton {
    [[YTBaseNavigationController shareNavgationController] popViewControllerAnimated:YES];
}

@end

#pragma mark - YTWrapViewController

@implementation YTWrapViewController

+ (YTWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController {
    
    YTWrapNavigationController *wrapNavController = [[YTWrapNavigationController alloc] init];
    wrapNavController.viewControllers = @[viewController];
    
    YTWrapViewController *wrapViewController = [[YTWrapViewController alloc] init];
    [wrapViewController.view addSubview:wrapNavController.view];
    [wrapViewController addChildViewController:wrapNavController];
    
    return wrapViewController;
}

- (UITabBarItem *)tabBarItem {
    return [self rootViewController].tabBarItem;
}

- (NSString *)title {
    return [self rootViewController].title;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return [self rootViewController];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return [self rootViewController];
}

- (UIViewController *)rootViewController {
    YTWrapNavigationController *wrapNavController = self.childViewControllers.firstObject;
    return wrapNavController.viewControllers.firstObject;
}

@end

#pragma mark - YTNavigationController

@interface YTNavigationController ()

@end

@implementation YTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super init]) {
        self.viewControllers = @[[YTWrapViewController wrapViewControllerWithViewController:rootViewController]];
    }
    return self;
}

@end
