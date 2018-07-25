//
//  QYGoodsListTableViewCell.m
//  shopProject
//
//  Created by dzb on 2018/6/13.
//  Copyright © 2018 邱越. All rights reserved.
//

#import "QYGoodsListTableViewCell.h"

@interface QYGoodsListTableViewCell ()

@end

@implementation QYGoodsListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSubArray:(NSArray *)subArray {
    _subArray = subArray;

    for (int i = 0; i<self.imageArray.count; i++) {
        UIImageView *imageView = [self.imageArray objectAtIndex:i];
        UILabel *label = [self.labelArray objectAtIndex:i];
        if (i<_subArray.count) {
            imageView.hidden = NO;
            label.hidden = NO;
            NSDictionary *dict = [_subArray objectAtIndex:i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:dict[@"img"]] placeholderImage:nil];
            imageView.tag = self.indexPath.row + i; //设置 tag 方便以后点击事件判断点击那个图片
            label.text = dict[@"name"];

        } else {
            imageView.hidden = YES;
            label.hidden = YES;
        }
    }

}

@end
