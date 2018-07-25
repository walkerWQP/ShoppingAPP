//
//  QYShareViewCell.h
//  shopProject
//
//  Created by 邱越 on 2018/6/16.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYShareDataConts;
@interface QYShareViewCell : UITableViewCell
@property(nonatomic,strong)QYShareDataConts *shareData;
+(instancetype)cellWithtableView:(UITableView *)tableview;
@end
