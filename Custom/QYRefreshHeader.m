//
//  QYRefreshHeader.m
//  SheepTalK
//
//  Created by 邱越 on 2018/6/6.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYRefreshHeader.h"

@implementation QYRefreshHeader
/**
 *  初始化
 */
- (void)prepare
{
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    //self.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"赶紧下拉吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
     [self setTitle:@"所有数据加载完毕，没有更多的数据了..." forState:MJRefreshStateNoMoreData];
    self.lastUpdatedTimeLabel.hidden = YES;
     self.stateLabel.hidden = NO;
    self.state = MJRefreshStateNoMoreData;
}

/**
 *  摆放子控件
 */
- (void)placeSubviews
{
    [super placeSubviews];
    
//    self.logo.xmg_width = self.xmg_width;
//    self.logo.xmg_height = 50;
//    self.logo.xmg_x = 0;
//    self.logo.xmg_y = - 50;
}


@end
