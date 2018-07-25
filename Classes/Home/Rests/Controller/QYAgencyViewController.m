//
//  QYAgencyViewController.m
//  shopProject
//
//  Created by 邱越 on 2018/6/14.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYAgencyViewController.h"

@interface QYAgencyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *AgencyImageView;
@end

@implementation QYAgencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    [self setupAgencyHttpRequest];
}

-(void)setupAgencyHttpRequest{
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYAgencyDetailURL dict:nil succeed:^(id data) {
        NSDictionary *dict = data[@"data"][@"agency"];
        [self.AgencyImageView sd_setImageWithURL:[NSURL URLWithString:dict[@"img"]] placeholderImage:nil];
    } failure:^(NSError *error) {
    }];
}

//返回
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
