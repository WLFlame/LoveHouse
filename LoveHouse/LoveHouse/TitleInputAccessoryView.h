//
//  TitleInputAccessoryView.h
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleInputAccessoryView : UIView
+ (instancetype)titleInputAccessory:(void(^)())complete;
@end
