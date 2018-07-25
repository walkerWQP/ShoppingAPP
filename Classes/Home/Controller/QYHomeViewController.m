//
//  QYHomeViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYHomeViewController.h"
#import "SDCycleScrollView.h"
#import "WRImageHelper.h"
#import "WRNavigationBar.h"
#import "QYHomeCollectionViewCell.h"
#import "QYTodayHotGoodslTableViewCell.h"
#import "QYGoodsListTableViewCell.h"
#import "QYAgencyViewController.h"
#import "QYShareViewController.h"
#import "QYEarningViewController.h"
#import "QYLiveViewController.h"
#import "QYBatheViewController.h"
#import "QYSuperBaseViewController.h"
#import "QYBatheViewController.h"
#import "QYSuperViewController.h"
#import "QYSuperdutyViewController.h"
#import "QYPriceViewController.h"
#import "QYSalesViewController.h"
@interface QYHomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) SDCycleScrollView *advView;
@property (nonatomic, strong) UIButton *searchButton;

//图片数组
@property(nonatomic,strong)NSMutableArray *ImageArray;
///goodsArray
@property (nonatomic,strong) NSArray *goodsArray;
//首页排行数组
@property(nonatomic,strong)NSMutableArray *HomeImageArray;

//代理
@property(nonatomic,strong)QYAgencyViewController *AgencyVC;

//分享赚
@property(nonatomic,strong)QYShareViewController *ShareVC;

//收益
@property(nonatomic,strong)QYEarningViewController *EarningVC;

//直播
@property(nonatomic,strong)QYLiveViewController *LiveVC;

//精品推荐
@property(nonatomic,strong)QYSuperViewController *SuperVC;

//晒单
@property(nonatomic,strong)QYBatheViewController *BatheVC;

////超级劵  继承 QYSuperBaseViewController的控制器
@property(nonatomic,strong)QYSuperBaseViewController *SuperBaseVC;

//超级值
@property(nonatomic,strong)QYSuperdutyViewController *SuperdutyVC;

//实时销量
@property(nonatomic,strong)QYPriceViewController *PriceVC;

//今日爆款
@property(nonatomic,strong)QYSalesViewController *SalesVC;


@end

@implementation QYHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
     [self.view addSubview:self.tableView];
	[self addTableHeadView];
	
	[self.tableView registerNib:[UINib nibWithNibName:@"QYTodayHotGoodslTableViewCell" bundle:nil] forCellReuseIdentifier:@"QYTodayHotGoodslTableViewCell"];
	[self.tableView registerNib:[UINib nibWithNibName:@"QYGoodsListTableViewCell" bundle:nil] forCellReuseIdentifier:@"QYGoodsListTableViewCell"];
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
     [self setupHomeImageViewData];
    
    //首页推荐
    [self setupHomeImageArrayViewConts];
  
}
- (void)addTableHeadView {
	
	UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, 390.0f)];
	headView.backgroundColor = [UIColor whiteColor];
	self.tableView.tableHeaderView = headView;
	[headView addSubview:self.advView];
	
	//算法实例：
	int margin = 10;//间隙
	int width  = 60;//格子的宽
	int height = 60;//格子的高
	
	NSArray *titleArr = @[@"代理",@"分享赚",@"收益",@"直播",@"精品推荐",@"晒单",@"超级券",@"超级值",@"实时销量",@"今日爆款"];
	for (int i =0; i<10; i++) {
		int row = i/5;
		int col = i%5;
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		[btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"home%d",i+1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
		btn.frame = CGRectMake(20+col*(width+margin),210+row*(height+30), width, height);
		[headView addSubview:btn];
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(btn.frame),CGRectGetMaxY(btn.frame) + 6.0f,60.0f, 14.0f)];
		label.font = [UIFont systemFontOfSize:14.0f];
		label.textAlignment = NSTextAlignmentCenter;
		label.text = [titleArr objectAtIndex:i];
		[headView addSubview:label];
		
	}
	
}


-(void)click:(UIButton *)sender{
    switch (sender.tag){
        case 0:
             _AgencyVC= [[QYAgencyViewController alloc]init];
            [self.navigationController pushViewController:_AgencyVC animated:YES];
            break;
        case 1:
            _ShareVC= [[QYShareViewController alloc]init];
            [self.navigationController pushViewController:_ShareVC animated:YES];
            break;
        case 2:
            _EarningVC= [[QYEarningViewController alloc]init];
            [self.navigationController pushViewController:_EarningVC animated:YES];
            break;
        case 3:
            _LiveVC = [[QYLiveViewController alloc]init];
            [self.navigationController pushViewController:_LiveVC animated:YES];
            break;
        case 4:
            _SuperVC = [[QYSuperViewController alloc]init];
            [self.navigationController pushViewController:_SuperVC animated:YES];
            break;
        case 5:
             _BatheVC = [[QYBatheViewController alloc]init];
            [self.navigationController pushViewController:_BatheVC animated:YES];
            break;
        case 6:
            _SuperBaseVC = [[QYSuperBaseViewController alloc]init];
            [self.navigationController pushViewController:_SuperBaseVC animated:YES];
            break;
        case 7:
            _SuperdutyVC = [[QYSuperdutyViewController alloc]init];
            [self.navigationController pushViewController:_SuperdutyVC animated:YES];
            break;
        case 8:
            _PriceVC = [[QYPriceViewController alloc]init];
            [self.navigationController pushViewController:_PriceVC animated:YES];
            break;
        case 9:
            _SalesVC = [[QYSalesViewController alloc]init];
            [self.navigationController pushViewController:_SalesVC animated:YES];
            break;
        default:
            break;
    }

}
#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0,20.0f, kScreenWidth, kScreenHeight-20.0f);
        _tableView = [[UITableView alloc] initWithFrame:frame
        style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (SDCycleScrollView *)advView
{
    if (_advView == nil) {
        NSArray *localImages = @[@"http://img.taoyouji666.com/979f7b3f573f6da334152f254e124c3b",@"http://img.taoyouji666.com/863c6a8b01b3c758dce24d41d32de6c1",@"http://img.taoyouji666.com/be2504a3db0a9465947a17fc72de59ae",@"http://img.taoyouji666.com/67ff4173724358ed50e0362a4a29a58f"];
        _advView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0.0f, kScreenWidth, IMAGE_HEIGHT) imageNamesGroup:localImages];
        _advView.pageDotColor = [UIColor grayColor];
        _advView.autoScrollTimeInterval = 2;
        _advView.currentPageDotColor = [UIColor whiteColor];
        _advView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }
    return _advView;
}
//首页请求
-(void)setupHomeImageViewData{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"page"] = @"1";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request POST:@"http://gouwubang.lechuangapp.com/indexShow/homeLastPage" dict:dict succeed:^(id data) {
        self.ImageArray = data[@"data"][@"productList"];
        QYWriteToPlist(data, @"home.plist");
        [self.tableView reloadData];
    } failure:^(NSError *error) {

    }];
}
//图片请求
-(void)setupHomeImageArrayViewConts{
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:@"http://gouwubang.lechuangapp.com/indexShow/ProgramaImg" dict: nil succeed:^(id data) {
        self.HomeImageArray = data[@"data"][@"programaImgList"];
        QYWriteToPlist(data, @"imageArray.plist");
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if (section == 0) {
		return 1;
	} else  {
		NSInteger rowCount = (self.ImageArray.count + 1) / 2;
		return rowCount;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0)
		return 390.0f;
	else
		return 286.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return section == 1 ? 10.0f : 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if (indexPath.section == 0) {
		
		QYTodayHotGoodslTableViewCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:@"QYTodayHotGoodslTableViewCell"];
        NSInteger loc = indexPath.row;
        NSInteger len = 4;
        NSRange range = NSMakeRange(loc, len);
        
        ///不管 goodsArray 装的什么数据 都可以按下边方式 进行截取 在 cell.subArray setter方法里 取出数据赋值
        ///防止数组越界 取出子数组 len != 2 典型的如9个数组 第5次取的时候 只能取出来1个 不是2的倍数
        if (range.location+range.length > self.HomeImageArray.count) {
            range = NSMakeRange(loc,self.HomeImageArray.count-loc);
        }
        NSArray *subArray = [self.HomeImageArray subarrayWithRange:range];
        goodsCell.indexPath = indexPath;
        goodsCell.subArrays = subArray;
        
		return goodsCell;
	} else {
		
		QYGoodsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QYGoodsListTableViewCell"];
		
		NSInteger loc = indexPath.row;
		NSInteger len = 2;
		NSRange range = NSMakeRange(loc, len);

		if (range.location+range.length > self.ImageArray.count) {
			range = NSMakeRange(loc,self.ImageArray.count-loc);
		}
		NSArray *subArray = [self.ImageArray subarrayWithRange:range];
		cell.indexPath = indexPath;
		cell.subArray = subArray;
    
		return cell;

	}
	
}
@end
