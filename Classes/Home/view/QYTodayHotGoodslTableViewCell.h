//
//  QYTodayHotGoodslTableViewCell.h
//  shopProject
//
//  Created by dzb on 2018/6/13.
//  Copyright © 2018 邱越. All rights reserved.
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
