//
//  QYDetailViewCell.h
//  shopProject
//
//  Created by 邱越 on 2018/6/18.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYDetailConts;
@interface QYDetailViewCell : UITableViewCell
@property(nonatomic,strong)QYDetailConts *DetaiConts;
+(instancetype)cellWithtableView:(UITableView *)tableview;
@end
