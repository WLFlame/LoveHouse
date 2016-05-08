//
//  DiaryBottomCompleteView.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "DiaryBottomCompleteView.h"

@implementation DiaryBottomCompleteView

- (IBAction)btnClickSave:(id)sender {
    if ([self.delegate respondsToSelector:@selector(diaryBottomCompleteViewDidClickBack:)]) {
        [self.delegate diaryBottomCompleteViewDidClickSave:self];
    }
}

- (IBAction)btnClickBack:(id)sender {
    if ([self.delegate respondsToSelector:@selector(diaryBottomCompleteViewDidClickBack:)]) {
        [self.delegate diaryBottomCompleteViewDidClickBack:self];
    }
}

@end
