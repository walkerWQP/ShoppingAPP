//
//  QYSearchViewController.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYSearchViewController.h"
#import "UICountingLabel.h"
#import "JHWaterfallCollectionLayout.h"
#import "QYSearchConts.h"
#import "QYSearchViewCell.h"
#import "QYDetailViewController.h"
#import "QYShareConts.h"
@interface QYSearchViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,WaterFlowLayoutDelegate>
@property (nonatomic,strong) NSMutableArray* dataArray;
//优惠劵数量
@property (weak, nonatomic) IBOutlet UICountingLabel *DiscountLabel;
//@property(nonatomic,strong)UICollectionView *mainCollectionViews;
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionViews;

@property(nonatomic,strong)QYDetailViewController *DetailVC;

@end

@implementation QYSearchViewController
static NSString *identifier=@"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    //超级优惠价请求
    [self setupDiscountsHttpRequest];
    
    [self setupWaterfallConllView];
    
    //超级搜商品分类的请求
    [self setupRefresh];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
//超级优惠价请求
-(void)setupDiscountsHttpRequest{
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYDiscountsShowURL dict:nil succeed:^(id data) {
        NSString *newString = data[@"data"][@"couponCount"];
        NSInteger index = [newString integerValue];
        [self DiscountsWithShow:index];
    } failure:^(NSError *error) {

    }];
}

- (void)setupRefresh
{
    //下拉刷新
    self.mainCollectionViews.mj_header = [QYRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.mainCollectionViews.mj_header beginRefreshing];
}
-(void)loadNewTopics{
    AFNetworkingRequest *request = [AFNetworkingRequest sharedInstance];
    [request GET:QYClassifyShowURL dict:nil succeed:^(id data) {
        self.dataArray = [QYSearchConts mj_objectArrayWithKeyValuesArray:data[@"data"][@"tbclassTypeList"]];
        [self.mainCollectionViews reloadData];
        [self.mainCollectionViews.mj_header endRefreshing];
        //在加载超级优惠价劵请求
        [self setupDiscountsHttpRequest];
    } failure:^(NSError *error) {
        [self.mainCollectionViews.mj_header endRefreshing];
    }];
}
-(void)DiscountsWithShow:(NSInteger )toString{
    _DiscountLabel.method = UILabelCountingMethodLinear;
    _DiscountLabel.format = @"共有%d张优惠劵";
    [_DiscountLabel countFrom:1 to:toString withDuration:3.0];
}


-(void)setupWaterfallConllView{
    
    JHWaterfallCollectionLayout* layout = [[JHWaterfallCollectionLayout alloc]init];
    layout.delegate = self ;
    //实现系统的set方法
    [_mainCollectionViews setCollectionViewLayout:layout];
    _mainCollectionViews.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    [_mainCollectionViews registerClass:[QYSearchViewCell class] forCellWithReuseIdentifier:identifier];
    
    //4.设置代理
    _mainCollectionViews.delegate = self;
    _mainCollectionViews.dataSource = self;
}

- (NSInteger)cloumnCountInWaterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout
{
    return  5;
}
#pragma mark - WaterFlowLayoutDelegate
- (CGFloat)waterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width{

    return 80;
}

#pragma mark collectionView代理方法

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:@"QYSearchViewCell"bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    QYSearchViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.searchConts= self.dataArray[indexPath.row];
    return cell;
}
//选中的操作
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYWearShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 1:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYUnderwearShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 2:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYMaleShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 3:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYMotherShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 4:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYAmericaShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 5:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYHouseShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 6:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYShoeShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 7:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYCateShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 8:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYTextShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 9:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYNumberShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
            break;
        case 10:
            _DetailVC = [[QYDetailViewController alloc]init];
            _DetailVC.typeIndex = QYOtherShowType;
            [self.navigationController pushViewController:_DetailVC animated:YES];
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
