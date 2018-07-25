//
//  QYBatheViewController.m
//  shopProject
//
//  Created by 邱越 on 2018/6/14.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYBatheViewController.h"
#import "JHWaterfallCollectionLayout.h"
#import "QYSuperViewCell.h"
@interface QYBatheViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,WaterFlowLayoutDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,assign)QYTopicType type;
//创建一个UICollectionView
@property(nonatomic,strong)UICollectionView *mainCollectionViews;

@end

@implementation QYBatheViewController
static NSString *identifier=@"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"晒单广场";
    [self setupWaterfallConllView];
    
    [self setupRefresh];
    
}

-(void)setupWaterfallConllView{
    
    
    JHWaterfallCollectionLayout* layout = [[JHWaterfallCollectionLayout alloc]init];
    layout.delegate = self ;
    
    //2.初始化collectionView
    _mainCollectionViews = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    [self.view addSubview:_mainCollectionViews];
    _mainCollectionViews.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    [_mainCollectionViews registerClass:[QYSuperViewCell class] forCellWithReuseIdentifier:identifier];
    
    //4.设置代理
    _mainCollectionViews.delegate = self;
    _mainCollectionViews.dataSource = self;
}

- (void)setupRefresh
{
    //    //下拉刷新
    self.mainCollectionViews.mj_header = [QYRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.mainCollectionViews.mj_header beginRefreshing];
    // 上拉刷新
    self.mainCollectionViews.mj_footer = [QYRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}
//下拉刷新
-(void)loadNewTopics{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"page"] = @"1";
    AFNetworkingRequest *requset = [AFNetworkingRequest sharedInstance];
    [requset GET:QYOrderShowListURL dict:dict succeed:^(id data) {
        self.dataArray = [QYBaseConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
        [self.mainCollectionViews reloadData];
        self.mainCollectionViews.mj_header.state = MJRefreshStateNoMoreData;
        [self.mainCollectionViews.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [self.mainCollectionViews.mj_header endRefreshing];
    }];
}
//上拉刷新
-(void)loadMoreTopics{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"page"] = @"1";
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYOrderShowListURL dict:dict succeed:^(id data) {
        self.dataArray = [QYBaseConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
        [self.mainCollectionViews reloadData];
         self.mainCollectionViews.mj_footer.state = MJRefreshStateNoMoreData;
        [self.mainCollectionViews.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [self.mainCollectionViews.mj_footer endRefreshing];
    }];
}


#pragma mark - WaterFlowLayoutDelegate
- (CGFloat)waterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width{
    
    return 245;
}
////决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout
{
    return  2 ;
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:@"QYSuperViewCell"bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    QYSuperViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.base = self.dataArray[indexPath.row];
    return cell;
}


@end
