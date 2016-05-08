//
//  DiaryContentAccessoryView.h
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DiaryContentAccessoryView;
@protocol DiaryContentAccessoryViewDelegate <NSObject>

- (void)diaryContentAccessoryViewClickChosePhoto:(DiaryContentAccessoryView *)view;

@end

@interface DiaryContentAccessoryView : UIView
@property (nonatomic, weak) id<DiaryContentAccessoryViewDelegate> delegate;
+ (instancetype)diaryContentAccessory:(void(^)())complete;
@end
