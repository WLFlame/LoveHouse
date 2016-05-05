//
//  TimeLineCell.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/1.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "TimeLineCell.h"
#import "NSString+Size.h"

@interface TimeLineCell()
@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (nonatomic, strong) UIImageView *imgArrowBuddle;
@property (weak, nonatomic) IBOutlet UIImageView *imgTimeLine;
@property (nonatomic, strong) UILabel *memorialLabel;
@end


@implementation TimeLineCell

- (UILabel *)memorialLabel
{
    if (!_memorialLabel) {
        _memorialLabel = [[UILabel alloc] init];
        _memorialLabel.font = [UIFont systemFontOfSize:11];
        _memorialLabel.textColor = [UIColor whiteColor];
        _memorialLabel.text = @"shushsushsu";
    }
    return _memorialLabel;
}

- (UIImageView *)imgArrowBuddle
{
    if (!_imgArrowBuddle) {
        _imgArrowBuddle = [[UIImageView alloc] init];
        UIImage *memory = [UIImage imageNamed:@"memoryDayBuddle"];
        _imgArrowBuddle.image = [memory stretchableImageWithLeftCapWidth:memory.size.width / 2 topCapHeight:memory.size.height / 2];
    }
    return _imgArrowBuddle;
}

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    __weak typeof(self) ws = self;
    [ws.contentView addSubview:self.imgArrowBuddle];
    self.imgArrowBuddle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.imgArrowBuddle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.imgTimeLine).offset(10);
        make.centerY.equalTo(ws.contentView);
        
    }];
    
    [self.imgArrowBuddle addSubview:self.memorialLabel];
    self.memorialLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.memorialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.imgArrowBuddle).offset(5);
        make.bottom.equalTo(ws.imgArrowBuddle).offset(-10);
        make.left.equalTo(ws.imgArrowBuddle).offset(10);
        make.right.equalTo(ws.imgArrowBuddle).offset(-5);
    }];
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.memorialLabel.text = text;
    __weak typeof(self) ws = self;
    [self.imgArrowBuddle mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat width = [text widthWithFont:ws.memorialLabel.font constrainedToHeight:13] + 15;
        make.width.mas_equalTo(width);
    }];
}

@end
