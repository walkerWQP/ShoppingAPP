//
//  QYLiveViewCell.h
//  shopProject
//
//  Created by 邱越 on 2018/6/17.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYLiveConts;
@interface QYLiveViewCell : UITableViewCell
@property(nonatomic,strong)QYLiveConts *liveConts;
+(instancetype)cellWithtableView:(UITableView *)tableview;
@end
