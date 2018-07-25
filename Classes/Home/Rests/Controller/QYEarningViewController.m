//
//  QYEarningViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYEarningViewController.h"

@interface QYEarningViewController ()

@end

@implementation QYEarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
}
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
