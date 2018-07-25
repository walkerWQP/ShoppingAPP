//
//  QYSearchViewCell.m
//  shopProject
//
//  Created by 邱越 on 2018/6/15.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYSearchViewCell.h"
#import "QYSearchConts.h"
@interface QYSearchViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation QYSearchViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setSearchConts:(QYSearchConts *)searchConts{
    _searchConts = searchConts;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:searchConts.img] placeholderImage:nil];
    self.nameLabel.text = searchConts.name;
}

@end
