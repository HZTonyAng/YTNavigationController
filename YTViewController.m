//
//  YTViewController.m
//  JTNavigationController
//
//  Created by TonyAng on 16/7/20.
//  Copyright © 2016年 JiananTian. All rights reserved.
//

#import "YTViewController.h"
#import "YTViewBController.h"
@interface YTViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation YTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"YTView";
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(0, 0, 50, 50);
    self.btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    self.btn.center = self.view.center;
    [self.btn addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}

-(void)Action:(UIButton *)button{
    YTViewBController *ytView = [YTViewBController new];
    [self.navigationController pushViewController:ytView animated:ytView];
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
