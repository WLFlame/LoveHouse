//
//  AlbumCell.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/30.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
+ (NSString *)reuseId;
@end
