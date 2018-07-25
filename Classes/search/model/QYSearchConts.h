//
//  QYSearchConts.h
//  shopProject
//
//  Created by 邱越 on 2018/6/15.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYSearchConts : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *img;
//商品分类的ID
@property(nonatomic,assign)NSInteger parentId;

@end
