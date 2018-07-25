//
//  QYShareViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYShareViewController.h"
#import "QYShareConts.h"
#import "SPPageMenu.h"
#import "QYShareViewCell.h"
@interface QYShareViewController ()<SPPageMenuDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) SPPageMenu *pageMenu;
@property(nonatomic,strong) NSArray *titleArray;
@property(nonatomic,strong)NSArray *titleDaraArray;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation QYShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"分享赚";
    [self setupNavItems];
    
    [self setupShareHttpRequest];
    
    [self setupTableView];
    
}

-(void)setupTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH + 55, kScreenWidth, kScreenHeight-120) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 130;
    [self.view addSubview:_tableView];
}

- (void)setupNavItems
{
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"MainTagSubIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(ShareRightClick)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}
//分享赚触发事件
-(void)ShareRightClick{
    

}
-(void)setupShareHttpRequest{
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYShareDetailURL dict:nil succeed:^(id data) {
        self.titleArray = [QYShareConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"tbclassTypeList"]];
        //加载选项卡
         [self setupSegmentView];
    } failure:^(NSError *error) {
    }];
    
}

-(void)loadNewTopics:(QYShareType )shareType{
   [SVProgressHUD showWithStatus:@"加载中..."];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"classTypeId"] = @(shareType);
    dict[@"page"] = @"1";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYShareProductShowAllURL dict:dict succeed:^(id data) {
    self.titleDaraArray = [QYShareDataConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
    }];
}
//选项卡
-(void)setupSegmentView{
     SPPageMenu *pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, NaviH+10, kScreenWidth, pageMenuH) trackerStyle:SPPageMenuTrackerStyleLine];
       pageMenu.selectedItemTitleColor =RGBA(239, 54, 136, 1);
    // 传递数组，默认选中第2个
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        for(int i = 0; i < [self.titleArray count];i++)
        {
          QYShareConts *share = self.titleArray[i];
          [newArray addObject:share.rootName];
        }
    [pageMenu setItems:newArray selectedItemIndex:0];
    pageMenu.needTextColorGradients = NO;
    // 设置代理
    pageMenu.delegate = self;
    [self.view addSubview:pageMenu];
    _pageMenu = pageMenu;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleDaraArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QYShareViewCell *cell = [QYShareViewCell cellWithtableView:tableView];
    cell.shareData = self.titleDaraArray[indexPath.row];
    return cell;
    
}
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    switch (toIndex) {
        case 0:
            [self loadNewTopics:QYWearShowType];
        
          break;
        case 1:
            [self loadNewTopics:QYUnderwearShowType];
            break;
        case 2:
            [self loadNewTopics:QYMaleShowType];
            break;
        case 3:
            [self loadNewTopics:QYMotherShowType];
            break;
        case 4:
            [self loadNewTopics:QYAmericaShowType];
            break;
        case 5:
            [self loadNewTopics:QYHouseShowType];
            break;
        case 6:
            [self loadNewTopics:QYShoeShowType];
            break;
        case 7:
            [self loadNewTopics:QYCateShowType];
            break;
        case 8:
            [self loadNewTopics:QYTextShowType];
            break;
        case 9:
            [self loadNewTopics:QYNumberShowType];
            break;
        case 10:
            [self loadNewTopics:QYOtherShowType];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
