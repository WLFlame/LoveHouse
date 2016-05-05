//
//  AlbumReusableHeader.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/30.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "AlbumReusableHeader.h"

@implementation AlbumReusableHeader

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.text = @"2015 02 05";
        _textLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _textLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self configureUI];
        [self configureConstraints];
    }
    return self;
}

- (void)configureUI
{
    [self addSubview:self.textLabel];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)configureConstraints
{
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15);
    }];
}

+ (NSString *)reuseId
{
    return @"AlbumReusableHeader";
}

@end
