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
        UIImageView *backgroundImageView = [[UIImageView alloc] init];
        backgroundImageView.image = self.corpImage;
        [self.view addSubview:backgroundImageView];
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
    UIVisualEffectView *effectView;
    
    {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [self.view addSubview:effectView];
        effectView.translatesAutoresizingMaskIntoConstraints = NO;
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
    // 添加裁剪图片
    {
        UIImageView *cropRect = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RectangleCrop"]];
        [effectView.contentView addSubview:cropRect];
        cropRect.translatesAutoresizingMaskIntoConstraints = NO;
        [cropRect mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(effectView.contentView);
            
        }];
    }
    
    
}



@end
