//
//  QYDetailViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYDetailViewController.h"
#import "SPPageMenu.h"
#import "QYShareConts.h"
#import "QYDetailConts.h"
#import "QYDetailViewCell.h"
@interface QYDetailViewController ()<SPPageMenuDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation QYDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    [self setupSegmentView];
    [self setupTableView];

}
-(void)setupTableView{
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, NaviH + 100, kScreenWidth, kScreenHeight-165) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 110;
    [self.view addSubview:_tableView];
}
//选项卡
-(void)setupSegmentView{
    NSArray *titleArray = @[@"销量",@"好评",@"价格",@"新品"];
    SPPageMenu *pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, NaviH+55, kScreenWidth, pageMenuH) trackerStyle:SPPageMenuTrackerStyleLine];
    pageMenu.selectedItemTitleColor =RGBA(239, 54, 136, 1);
    [pageMenu setItems:titleArray selectedItemIndex:0];
    pageMenu.permutationWay = SPPageMenuPermutationWayNotScrollAdaptContent;
    // 设置代理
    pageMenu.delegate = self;
    [self.view addSubview:pageMenu];
    
}
//销量请求
-(void)setupSalesHttpRequest{
    [SVProgressHUD showWithStatus:@"加载中..."];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"classTypeId"] = @(self.typeIndex);
    dict[@"flag"] = @"1";
    dict[@"isVolume"] = @"1";
    dict[@"page"] = @"1";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYSalesDetaillShowURL dict:dict succeed:^(id data) {
     self.dataArray = [QYDetailConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
    
}

//好评请求
-(void)setupReputationHttpRequest{
    [SVProgressHUD showWithStatus:@"加载中..."];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"classTypeId"] = @(self.typeIndex);
    dict[@"flag"] = @"1";
    dict[@"isAppraise"] = @"1";
    dict[@"page"] = @"1";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYSalesDetaillShowURL dict:dict succeed:^(id data) {
    self.dataArray = [QYDetailConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
    [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
    
}


//价格请求
-(void)setupPriceHttpRequest{
    [SVProgressHUD showWithStatus:@"加载中..."];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"classTypeId"] = @(self.typeIndex);
    dict[@"flag"] = @"1";
    dict[@"isPrice"] = @"2";
    dict[@"page"] = @"1";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYSalesDetaillShowURL dict:dict succeed:^(id data) {
        self.dataArray = [QYDetailConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
    
}

//新品请求
-(void)setupNewlyHttpRequest{
    [SVProgressHUD showWithStatus:@"加载中..."];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"classTypeId"] = @(self.typeIndex);
    dict[@"flag"] = @"1";
    dict[@"isNew"] = @"1";
    dict[@"page"] = @"1";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYSalesDetaillShowURL dict:dict succeed:^(id data) {
        self.dataArray = [QYDetailConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QYDetailViewCell *cell = [QYDetailViewCell cellWithtableView:tableView];
    cell.DetaiConts = self.dataArray[indexPath.row];
    return cell;
}

- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedAtIndex:(NSInteger)index{
    if (index == 0) {
        [self setupSalesHttpRequest];
    }else if (index == 1){
        [self setupReputationHttpRequest];
    }else if (index == 2){
        [self setupPriceHttpRequest];
    }else if (index == 3){
        [self setupNewlyHttpRequest];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
