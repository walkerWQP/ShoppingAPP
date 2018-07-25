//
//  QYShareConts.h
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,QYShareType){
    
      /****女装****/
    QYWearShowType  = 1,
      /****内衣****/
    QYUnderwearShowType = 2 ,
      /****男装****/
    QYMaleShowType = 3,
      /****母婴****/
    QYMotherShowType = 4 ,
      /****美妆****/
    QYAmericaShowType = 5,
      /****居家****/
    QYHouseShowType  = 6,
      /****鞋包服饰****/
    QYShoeShowType  =  7 ,
      /****美食****/
    QYCateShowType  = 8,
      /****文体车品****/
    QYTextShowType  = 9 ,
      /****数码家电****/
    QYNumberShowType = 10,
      /****其他****/
    QYOtherShowType = 11
    
};
@class QYShareDataConts;
@interface QYShareConts : NSObject
@property(nonatomic,copy)NSString *rootName;
@property(nonatomic,copy)NSString *img;
@property(nonatomic,assign)NSInteger parentId;
@end

@interface QYShareDataConts : NSObject
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *preferentialPrice;
@property(nonatomic,copy)NSString *nowCount;
@property(nonatomic,copy)NSString *couponMoney;
//每个type不一样
@property(nonatomic,assign)QYShareType shareType;
@end
