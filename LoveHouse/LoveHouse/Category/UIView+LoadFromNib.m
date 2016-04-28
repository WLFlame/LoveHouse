//
//  UIView+LoadFromNib.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "UIView+LoadFromNib.h"

@implementation UIView (LoadFromNib)
+ (instancetype)create
{
    return LoadViewFromNib(NSStringFromClass([self class]));
}

@end
