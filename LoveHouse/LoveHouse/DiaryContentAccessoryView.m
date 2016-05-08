//
//  DiaryContentAccessoryView.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "DiaryContentAccessoryView.h"

@interface DiaryContentAccessoryView()
@property (nonatomic, copy) void(^complete)();

@end

@implementation DiaryContentAccessoryView

+ (instancetype)diaryContentAccessory:(void (^)())complete
{
    DiaryContentAccessoryView *view = LoadViewFromNib(@"DiaryContentAccessoryView");
    view.complete = complete;
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    return view;
}

- (IBAction)btnClickChosePhoto:(id)sender {
    if ([self.delegate respondsToSelector:@selector(diaryContentAccessoryViewClickChosePhoto:)]) {
        [self.delegate diaryContentAccessoryViewClickChosePhoto:self];
    }
}

- (IBAction)btnClickComplete:(id)sender {
    if (self.complete) {
        self.complete();
    }
}

@end
