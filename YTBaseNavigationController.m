//
//  JTBaseNavigationController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "YTBaseNavigationController.h"

@interface YTBaseWrapViewController : UIViewController

@end

@implementation YTBaseWrapViewController

- (UIViewController *)childViewControllerForStatusBarStyle {
    return [self rootViewController];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return [self rootViewController];
}

- (UIViewController *)rootViewController {
    return self.childViewControllers.firstObject;
}


@end

@interface YTBaseNavigationController () <UINavigationControllerDelegate>

@end

@implementation YTBaseNavigationController

+ (instancetype)shareNavgationController {
    
    static YTBaseNavigationController *baseNavigationController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseNavigationController = [[YTBaseNavigationController alloc] init];
    });
    
    return baseNavigationController;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    YTBaseNavigationController *baseNavigationController = [YTBaseNavigationController shareNavgationController];
    baseNavigationController.viewControllers = @[[self wrapViewConrollerWithViewController:rootViewController]];
    return baseNavigationController;
}

- (UIViewController *)wrapViewConrollerWithViewController:(UIViewController *)viewController {
    YTBaseWrapViewController *wrapViewController = [[YTBaseWrapViewController alloc] init];
    [wrapViewController.view addSubview:viewController.view];
    [wrapViewController addChildViewController:viewController];
    return wrapViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = nil;
}

//解决某些情况push会卡死的情况
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isRootVC = viewController == navigationController.viewControllers.firstObject;
    navigationController.interactivePopGestureRecognizer.enabled = !isRootVC;
}

@end
