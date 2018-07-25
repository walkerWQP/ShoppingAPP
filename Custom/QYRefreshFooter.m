//
//  QYRefreshFooter.m
//  SheepTalK
//
//  Created by 邱越 on 2018/6/6.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYRefreshFooter.h"

@implementation QYRefreshFooter
- (void)prepare
{
    [super prepare];
    
//    self.stateLabel.textColor = [UIColor orangeColor];
//    
//  //  [self addSubview:[UIButton buttonWithType:UIButtonTypeContactAdd]];
//    
//    // 刷新控件出现一半就会进入刷新状态
//    self.triggerAutomaticallyRefreshPercent = 0.5;
//    
//    // 不要自动刷新
//    self.automaticallyRefresh = NO;
    
    self.automaticallyChangeAlpha = YES;
//    self.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"赶紧下拉吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"所有数据加载完毕，没有更多的数据了..." forState:MJRefreshStateNoMoreData];
    //self.lastUpdatedTimeLabel.hidden = YES;
  //  self.lastUpdatedTimeLabel.hidden = YES;
     //self.lastUpdatedTimeKey = MJRefreshHeaderLastUpdatedTimeKey;
    self.stateLabel.hidden = NO;
    self.state = MJRefreshStateNoMoreData;
}

@end
