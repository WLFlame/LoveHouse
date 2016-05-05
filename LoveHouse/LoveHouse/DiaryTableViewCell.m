//
//  DiaryTableViewCell.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/1.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "DiaryTableViewCell.h"

@interface DiaryTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (weak, nonatomic) IBOutlet UILabel *lbDiaryTitle;

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation DiaryTableViewCell

- (void)awakeFromNib {
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor flatWhiteColor];
    
}

- (IBAction)btnClickEdit:(id)sender {
}



@end
