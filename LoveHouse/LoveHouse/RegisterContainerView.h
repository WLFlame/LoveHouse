//
//  RegisterContainerView.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/23.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RegisterContainerView;
@protocol RegisterContainerViewDelegate <NSObject>
// 点击注册按钮
- (void)registerContainerViewDidClickSure:(RegisterContainerView *)container;
// 点击了返回
- (void)registerContainerViewDidClickBack:(RegisterContainerView *)container;
// 点击了选择照片
- (void)registerContainerViewDidChoseAvatar:(RegisterContainerView *)container;
@end

@interface RegisterContainerView : UIView
@property (nonatomic, weak) id<RegisterContainerViewDelegate> delegate;
@property (nonatomic, strong) UIImageView *avatarView;
@end
