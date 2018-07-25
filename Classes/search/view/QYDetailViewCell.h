//
//  QYDetailViewCell.h
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYDetailConts;
@interface QYDetailViewCell : UITableViewCell
@property(nonatomic,strong)QYDetailConts *DetaiConts;
+(instancetype)cellWithtableView:(UITableView *)tableview;
@end
