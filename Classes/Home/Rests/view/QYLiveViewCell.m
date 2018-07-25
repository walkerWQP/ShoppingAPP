//
//  QYLiveViewCell.m
//  shopProject
//
//  Created by 邱越 on 2018/6/17.
//  Copyright © 2018年 邱越. All rights reserved.
//

#import "QYLiveViewCell.h"
#import "QYLiveConts.h"
@interface QYLiveViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *couponMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
@implementation QYLiveViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setLiveConts:(QYLiveConts *)liveConts{
    _liveConts = liveConts;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:liveConts.img] placeholderImage:nil];
    self.productNameLabel.text = liveConts.productName;
    self.productTextLabel.text = liveConts.productText;
    self.couponMoneyLabel.text = [NSString stringWithFormat:@"%@元优惠劵",liveConts.couponMoney];
    self.priceTextLabel.text = liveConts.priceText;
    self.timeLabel.text = liveConts.sendOrderTimeStr;
}

+(instancetype)cellWithtableView:(UITableView *)tableview{
    QYLiveViewCell * cell = [tableview dequeueReusableCellWithIdentifier:@"QYLiveViewCell"];
    if (!cell) {
        cell =  [[NSBundle mainBundle]loadNibNamed:@"QYLiveViewCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
