//
//  QYTodayHotGoodslTableViewCell.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYTodayHotGoodslTableViewCell.h"
#import "QYHomeConts.h"
@interface QYTodayHotGoodslTableViewCell()


@end
@implementation QYTodayHotGoodslTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(void)setSubArrays:(NSArray *)subArrays{
    _subArrays = subArrays;
    for (int i = 0; i<self.ImageArrays.count; i++) {
        UIImageView *imageView = [self.ImageArrays objectAtIndex:i];
        if (i<_subArrays.count) { 
            imageView.hidden = NO;
            NSDictionary *dict = [_subArrays objectAtIndex:i];
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:dict[@"img"]] placeholderImage:nil];
            imageView.tag = self.indexPath.row + i;
            
        } else {
            imageView.hidden = YES;

        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
