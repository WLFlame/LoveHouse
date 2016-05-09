//
//  CropImageViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "CropImageViewController.h"

@interface CropImageViewController ()

@end

@implementation CropImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (void)configureUI
{
    {
        UIImageView *backgroundImageView                              = [[UIImageView alloc] init];
        backgroundImageView.image                                     = self.corpImage;
        [self.view addSubview:backgroundImageView];
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }

    UIVisualEffectView *effectView;

    {
        UIBlurEffect *blurEffect                                      = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        effectView                                                    = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [self.view addSubview:effectView];
        effectView.translatesAutoresizingMaskIntoConstraints          = NO;
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }

    UIButton *noticeBtn;

    {
        noticeBtn                                                     = [[UIButton alloc] init];
        [noticeBtn setTitle:@"使用原图" forState:UIControlStateNormal];
        [noticeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        noticeBtn.titleLabel.font                                     = [UIFont systemFontOfSize:17];
        [effectView.contentView addSubview:noticeBtn];
        noticeBtn.translatesAutoresizingMaskIntoConstraints           = NO;
        [noticeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(100);
            make.centerX.equalTo(self.view);
        }];

    }

    UIButton *choseCropNoticeBtn;

    {
        choseCropNoticeBtn                                            = [[UIButton alloc] init];
        [choseCropNoticeBtn setTitle:@"裁剪" forState:UIControlStateNormal];
        [choseCropNoticeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        choseCropNoticeBtn.titleLabel.font                            = [UIFont systemFontOfSize:17];
        [effectView.contentView addSubview:choseCropNoticeBtn];
        choseCropNoticeBtn.translatesAutoresizingMaskIntoConstraints  = NO;
        [choseCropNoticeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(noticeBtn).offset(20);
            make.centerX.equalTo(self.view);
        }];
    }

    // 添加裁剪图片
    {
        UIImageView *cropRect                                         = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RectangleCrop"]];
        [effectView.contentView addSubview:cropRect];
        cropRect.translatesAutoresizingMaskIntoConstraints            = NO;
        [cropRect mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(effectView.contentView);

        }];
    }
    
    
}







@end
