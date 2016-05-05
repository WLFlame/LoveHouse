//
//  AlbumCell.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/30.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "AlbumCell.h"


@implementation AlbumCell


+ (NSString *)reuseId
{
    return @"AlbumCell";
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
//        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        _imageView.contentMode = UIViewContentModeScaleAspectFit;
      
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

@end
