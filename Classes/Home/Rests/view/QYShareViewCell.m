//
//  QYShareViewCell.m
//  shopProject
//
//  Created by 邱越 on 2018/6/16.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYShareViewCell.h"
#import "QYShareConts.h"
@interface QYShareViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *HeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *preferentialPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *nowCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowNumberLabel;

@end
@implementation QYShareViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setShareData:(QYShareDataConts *)shareData{
    _shareData = shareData;
    [self.HeadImageView sd_setImageWithURL:[NSURL URLWithString:shareData.img] placeholderImage:nil];
    self.nameLabel.text = shareData.name;
    self.priceLabel.text = [NSString stringWithFormat:@"现价 ¥%@",shareData.price];
     self.preferentialPriceLabel.text = [NSString stringWithFormat:@"劵后价 ¥%@ 元",shareData.preferentialPrice];
    [self.nowCountLabel setTitle:[NSString stringWithFormat:@"劵 %@ 元",shareData.couponMoney] forState:UIControlStateNormal];
     self.nowNumberLabel.text = [NSString stringWithFormat:@"已售 ¥%@ 件",shareData.nowCount];
    
}
+(instancetype)cellWithtableView:(UITableView *)tableview{
    QYShareViewCell * cell = [tableview dequeueReusableCellWithIdentifier:@"QYShareViewCell"];
    if (!cell) {
        cell =  [[NSBundle mainBundle]loadNibNamed:@"QYShareViewCell" owner:self options:nil].firstObject;
    }
    return cell;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
