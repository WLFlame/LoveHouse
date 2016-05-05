//
//  AlbumReusableHeader.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/30.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumReusableHeader : UICollectionReusableView
@property (nonatomic, strong) UILabel *textLabel;
+ (NSString *)reuseId;
@end
