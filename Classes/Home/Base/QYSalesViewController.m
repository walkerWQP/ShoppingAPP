//
//  QYSalesViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYSalesViewController.h"

@interface QYSalesViewController ()

@end

@implementation QYSalesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"今日爆款";
}
//修改类型 内部实现get方法 外界无法访问 将来可以修改子控制器的内容
-(QYTopicType )type{
    return 8;
}



@end
