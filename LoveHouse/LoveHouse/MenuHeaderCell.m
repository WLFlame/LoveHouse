//
//  MenuHeaderCell.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "MenuHeaderCell.h"

@interface MenuHeaderCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgHeader;

@end

@implementation MenuHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imgHeader.layer.cornerRadius = 30;
    self.imgHeader.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
