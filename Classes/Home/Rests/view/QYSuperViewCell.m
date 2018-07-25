//
//  QYSuperViewCell.m
//  shopProject
//
//  Created by 邱越 on 2018/6/14.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYSuperViewCell.h"
#import "QYBaseConts.h"
@interface QYSuperViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *HeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *PricelistLabel;

@end
@implementation QYSuperViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setBase:(QYBaseConts *)base{
    _base = base;
    self.nameLabel.text = base.name;
    [self.HeadImageView sd_setImageWithURL:[NSURL URLWithString:base.img] placeholderImage:nil];
    self.PriceLabel.text = [NSString stringWithFormat:@"现价 ¥%@",base.price];
    self.PricelistLabel.text = [NSString stringWithFormat:@"劵后价 ¥%@",base.preferentialPrice];
}

@end
