//
//  QYExplodeViewController.m
//  shopProject
//
//  Created by 邱越 on 2018/6/10.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYExplodeViewController.h"
#import "QYRefreshHeader.h"
#import "QYRefreshFooter.h"
#import "JHWaterfallCollectionLayout.h"
#import "QYExplodeViewCell.h"
#import "QYExplpde.h"
@interface QYExplodeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,WaterFlowLayoutDelegate>
@property (nonatomic,strong) NSMutableArray* dataArray;
@property(nonatomic,strong)UICollectionView *mainCollectionViews;
@end

@implementation QYExplodeViewController
static NSString *identifier=@"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"爆料";
    self.view.backgroundColor = [UIColor whiteColor];
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
    [_mainCollectionViews registerClass:[QYExplodeViewCell class] forCellWithReuseIdentifier:identifier];
    
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
    [requset POST:QYtipOffShowURL dict:dict succeed:^(id data) {
        self.dataArray = [QYExplpde mj_objectArrayWithKeyValuesArray:data[@"data"][@"list"]];
        [self.mainCollectionViews reloadData];
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
    [request POST:QYtipOffShowURL dict:dict succeed:^(id data) {
        self.dataArray = [QYExplpde mj_objectArrayWithKeyValuesArray:data[@"data"][@"list"]];
        [self.mainCollectionViews reloadData];
        [self.mainCollectionViews.mj_header endRefreshing];
        self.mainCollectionViews.mj_footer.state = MJRefreshStateNoMoreData;
    } failure:^(NSError *error) {
        [self.mainCollectionViews.mj_header endRefreshing];
    }];
}

#pragma mark - WaterFlowLayoutDelegate
- (CGFloat)waterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width{
      QYExplpde *plpde =self.dataArray[index];
      return  plpde.height * 240 / plpde.width;
}


////决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout
{
    return  2;
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
    UINib *nib = [UINib nibWithNibName:@"QYExplodeViewCell"bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    QYExplodeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.explode = self.dataArray[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
