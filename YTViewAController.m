//
//  YTViewAController.m
//  YTNavigationController
//
//  Created by TonyAng on 16/7/20.
//  Copyright © 2016年 TonyAng. All rights reserved.
//

#import "YTViewAController.h"
#import "YTNavigationController.h"

@interface YTViewAController ()

@end

@implementation YTViewAController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ViewA";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didTapNextButton {
    YTViewAController *viewController = [[YTViewAController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

//- (IBAction)didTapPopButton:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (IBAction)didTapPopToButton:(id)sender {
//    YTWrapNavigationController *nav = (YTWrapNavigationController *)self.navigationController;
//    [self.navigationController popToViewController:nav.rootViewControllers.firstObject animated:YES];
//}
//
//- (IBAction)didTapPopToRootButton:(id)sender {
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    
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
