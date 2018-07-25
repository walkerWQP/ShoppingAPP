//
//  QYLiveViewCell.h
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYLiveConts;
@interface QYLiveViewCell : UITableViewCell
@property(nonatomic,strong)QYLiveConts *liveConts;
+(instancetype)cellWithtableView:(UITableView *)tableview;
@end
