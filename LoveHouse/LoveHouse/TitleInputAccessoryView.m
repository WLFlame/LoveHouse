//
//  TitleInputAccessoryView.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "TitleInputAccessoryView.h"

@interface TitleInputAccessoryView()
@property (weak, nonatomic) IBOutlet UILabel *lbSummary;
@property (nonatomic, copy) void(^complete)();
@end

@implementation TitleInputAccessoryView

+ (instancetype)titleInputAccessory:(void (^)())complete
{
    TitleInputAccessoryView *view = LoadViewFromNib(@"TitleInputAccessoryView");
    view.complete = complete;
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    return view;
}

- (IBAction)btnClickComplete:(id)sender {
    if (self.complete) {
        self.complete();
    }
}


@end
