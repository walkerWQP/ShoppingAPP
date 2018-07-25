//
//  QYLiveViewController.m
//  shopProject
//
//  Created by 邱越 on 2018/6/14.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYLiveViewController.h"
#import "QYLiveViewCell.h"
#import "QYLiveConts.h"
@interface QYLiveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *liveArray;
@property(nonatomic,copy)NSString *dataTimeString;
@property (weak, nonatomic) IBOutlet UITableView *liveTableView;
@end

@implementation QYLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"直播";
    self.navigationController.navigationBarHidden = NO;
    [self setupLiveHttpRequest];
    _liveTableView.rowHeight = 400;
}

-(void)setupLiveHttpRequest{
    [SVProgressHUD showWithStatus:@"加载中..."];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"time"] = @"2018-06-02 17:07:51";
    dict[@"type"] = @"2";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYzhibojianURL dict:dict succeed:^(id data) {
        self.liveArray = [QYLiveConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"zhibojian"][@"list"]];
        [self.liveTableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.liveArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     QYLiveViewCell *cell = [QYLiveViewCell cellWithtableView:tableView];
     cell.liveConts = self.liveArray[indexPath.row];
    return cell;
}


@end
