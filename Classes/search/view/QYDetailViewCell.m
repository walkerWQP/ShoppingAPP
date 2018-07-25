//
//  QYDetailViewCell.m
//  shopProject
//
//  Created by walker on 2018/6/6.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "QYDetailViewCell.h"
#import "QYDetailConts.h"
@interface QYDetailViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowNumberLabel;
@end
@implementation QYDetailViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setDetaiConts:(QYDetailConts *)DetaiConts{
    _DetaiConts = DetaiConts;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:DetaiConts.img] placeholderImage:nil];
    self.productNameLabel.text = DetaiConts.productName;
    self.priceLabel.text = [NSString stringWithFormat:@"现价 ¥%@ 元",DetaiConts.price];
    self.nowNumberLabel.text = [NSString stringWithFormat:@"已抢%@件",DetaiConts.nowNumber];
    
}
+(instancetype)cellWithtableView:(UITableView *)tableview{
    QYDetailViewCell * cell = [tableview dequeueReusableCellWithIdentifier:@"QYDetailViewCell"];
    if (!cell) {
        cell =  [[NSBundle mainBundle]loadNibNamed:@"QYDetailViewCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
