//
//  QYGoodsListTableViewCell.h
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYGoodsListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageArray;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelArray;

@property (nonatomic,strong) NSArray *subArray;

@property (nonatomic,assign) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
