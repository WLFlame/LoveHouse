//
//  ForgetPasswordContainerView.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/23.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ForgetPasswordContainerView;
@protocol ForgetPasswordContainerViewDelegate <NSObject>

- (void)forgetPasswordContainerViewDidClickSure:(ForgetPasswordContainerView *)container;
- (void)forgetPasswordContainerViewDidClickBack:(ForgetPasswordContainerView *)container;
@end

@interface ForgetPasswordContainerView : UIView
@property (nonatomic, weak) id<ForgetPasswordContainerViewDelegate> delegate;
@end
