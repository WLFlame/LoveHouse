//
//  DiaryBottomCompleteView.h
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiaryBottomCompleteView;
@protocol DiaryBottomCompleteViewDelegate <NSObject>

- (void)diaryBottomCompleteViewDidClickSave:(DiaryBottomCompleteView *)completeView;

- (void)diaryBottomCompleteViewDidClickBack:(DiaryBottomCompleteView *)completeView;

@end

@interface DiaryBottomCompleteView : UIView
@property (nonatomic, weak) id<DiaryBottomCompleteViewDelegate> delegate;
@end
