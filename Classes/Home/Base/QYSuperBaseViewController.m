//
//  QYSuperBaseViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYSuperBaseViewController.h"
#import "QYSuperViewCell.h"
#import "JHWaterfallCollectionLayout.h"
@interface QYSuperBaseViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,WaterFlowLayoutDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,assign)QYTopicType type;
//创建一个UICollectionView
@property(nonatomic,strong)UICollectionView *mainCollectionViews;

//下一页数据
@property(nonatomic,assign)id pages;
@end

@implementation QYSuperBaseViewController
static NSString *identifier=@"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
      self.navigationItem.title = @"超级劵";
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
//修改类型 内部实现get方法 外界无法访问 将来可以修改子控制器的内容
-(QYTopicType)type{
    return 6;
}
//下拉刷新
-(void)loadNewTopics{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"page"] = @"1";
    dict[@"type"] = @(self.type);
    AFNetworkingRequest *requset = [AFNetworkingRequest sharedInstance];
    [requset GET:QYProductShowURL dict:dict succeed:^(id data) {
        self.dataArray = [QYBaseConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"productList"]];
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
    dict[@"type"] = @(self.type);
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYProductShowURL dict:dict succeed:^(id data) {
        [self.mainCollectionViews reloadData];
        self.mainCollectionViews.mj_footer.state = MJRefreshStateNoMoreData;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
