//
//  QYExplodeViewCell.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYExplodeViewCell.h"
#import "QYExplpde.h"
@interface QYExplodeViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *pageViewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *praiseCountLabel;


@end
@implementation QYExplodeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setExplode:(QYExplpde *)explode{
    _explode = explode;
    self.titleLabel.text = explode.title;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:explode.img] placeholderImage:nil];
    self.pageViewsLabel.text = [NSString stringWithFormat:@"%ld",explode.pageViews];
    self.praiseCountLabel.text = [NSString stringWithFormat:@"%ld",explode.praiseCount];
}

@end
