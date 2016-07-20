//
//  JTNavigationController.h
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YTWrapNavigationController : UINavigationController

@property (nonatomic, copy) NSArray<UIViewController *> *rootViewControllers;

@end



@interface YTWrapViewController : UIViewController

+ (YTWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController;

@end



@interface YTNavigationController : UINavigationController

@end

