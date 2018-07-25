//
//  QYTodayHotGoodslTableViewCell.h
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface QYTodayHotGoodslTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ImageArrays;

//图片数组
@property (nonatomic,strong) NSArray *subArrays;

@property (nonatomic,assign) NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
