//
//  QYGoodsListTableViewCell.h
//  shopProject
//
//  Created by dzb on 2018/6/13.
//  Copyright © 2018 邱越. All rights reserved.
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
