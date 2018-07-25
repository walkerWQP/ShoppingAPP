//
//  QYShareViewCell.h
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYShareDataConts;
@interface QYShareViewCell : UITableViewCell
@property(nonatomic,strong)QYShareDataConts *shareData;
+(instancetype)cellWithtableView:(UITableView *)tableview;
@end
