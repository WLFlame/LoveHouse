//
//  ChoseCropView.m
//  LoveHouse
//
//  Created by ywl on 16/5/9.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "ChoseCropView.h"

@interface ChoseCropView()

@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSArray *imagenames;
@end

@implementation ChoseCropView

- (instancetype)init
{
    if (self = [super init]) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI
{
    NSArray *imagenames = @[@"OvalCrop", @"RectangleCrop", @"RectangleRound", @"Star", @"taoxin", @"Triangle"];
    self.imagenames = imagenames;
    self.btns = [NSMutableArray array];
    for (NSString *imagename in imagenames) {
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(btnClickChose:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = [imagenames indexOfObject:imagename];
        [self addSubview:btn];
        [self.btns addObject:btn];
        [btn setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    }
}

- (void)btnClickChose:(UIButton *)sender
{
    if (self.didChoseImage) {
        self.didChoseImage([UIImage imageNamed:self.imagenames[sender.tag]], sender.tag);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSUInteger clumnCount = 4;
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width / clumnCount;
    CGFloat btnH = btnW;
    for (UIButton *btn in self.btns) {
        NSInteger index = [self.btns indexOfObject:btn];
        NSInteger col = index % clumnCount;
        NSInteger row = index / clumnCount;
        
        btn.left = col *btnW;
        btn.top = row* btnH;
        btn.width = btnW;
        btn.height = btnH;
    }
}

@end






