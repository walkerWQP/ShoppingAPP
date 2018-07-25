//
//  QYSuperdutyViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYSuperdutyViewController.h"

@interface QYSuperdutyViewController ()

@end

@implementation QYSuperdutyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"超级值";
    // Do any additional setup after loading the view.
}
//修改类型 内部实现get方法 外界无法访问 将来可以修改子控制器的内容
-(QYTopicType )type{
    return 5;
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
