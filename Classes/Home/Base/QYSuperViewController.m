//
//  QYSuperViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYSuperViewController.h"

@interface QYSuperViewController ()

@end

@implementation QYSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.navigationItem.title = @"精品推荐";
    
}
//修改类型 内部实现get方法 外界无法访问 将来可以修改子控制器的内容
-(QYTopicType )type{
    return 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
