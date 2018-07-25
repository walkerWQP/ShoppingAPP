//
//  QYBaseConts.h
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,QYTopicType){
    
     /**********精品推荐枚举****/
     QYProductsShowTypeAll = 1,
//    /**********晒单枚举****/
//    QYShowListTypeAll = 0,
    /**********超级劵枚举****/
    QYShowTypeAll = 6,
    /**********超级值枚举****/
    QYShowTypePicture = 5,
    /**********实时销量枚举****/
    QYShowTypeWord = 7,
    /**********今日爆款枚举****/
    QYShowTypeIndex = 8,
    
};
@interface QYBaseConts : NSObject
//每个type不一样
@property (nonatomic, assign) QYTopicType type;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *img;

@property(nonatomic,copy)NSString *price;

@property(nonatomic,copy)NSString *preferentialPrice;
@end
