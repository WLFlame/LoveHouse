//
//  CropImageViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "CropImageViewController.h"
#import "ChoseCropView.h"
@interface CropImageViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIButton *userOriginBtn;
@property (nonatomic, strong) UIButton *cropBtn;
@property (nonatomic, strong) ChoseCropView *cropView;
@property (nonatomic, strong) UIVisualEffectView *effectView;
@end

@implementation CropImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (void)configureUI
{
    {
        UIScrollView *zoomScrollView = [[UIScrollView alloc] init];
        
        zoomScrollView.delegate = self;
        zoomScrollView.maximumZoomScale = 2.0;
        zoomScrollView.minimumZoomScale = 0.5;
    
        zoomScrollView.frame = CGRectMake(0, 0, self.view.width/2, self.view.width/2);
        zoomScrollView.backgroundColor = [UIColor redColor];
        zoomScrollView.center = self.view.center;
        [self.view addSubview:zoomScrollView];
        
        CGSize cropSize = self.corpImage.size;
        CGFloat cropImageWidth = self.view.width;
        CGFloat cropImageHeight = cropImageWidth / cropSize.width * cropSize.height;
        
        UIImageView *backgroundImageView                              = [[UIImageView alloc] init];
        self.backImageView = backgroundImageView;
        backgroundImageView.image                                     = self.corpImage;
        backgroundImageView.width = cropImageWidth;
        backgroundImageView.height = cropImageHeight;
        backgroundImageView.center = zoomScrollView.center;
        [self.view addSubview:backgroundImageView];
    
    }

    UIVisualEffectView *effectView;

    {
        UIBlurEffect *blurEffect                                      = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        effectView                                                    = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        self.effectView = effectView;
        [self.view addSubview:effectView];
        effectView.translatesAutoresizingMaskIntoConstraints          = NO;
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }

    UIButton *noticeBtn;

    {
        noticeBtn                                                     = [[UIButton alloc] init];
        self.userOriginBtn = noticeBtn;
        [noticeBtn setTitle:@"使用原图" forState:UIControlStateNormal];
        [noticeBtn setTitleColor:[UIColor navigationBarColor] forState:UIControlStateNormal];
        noticeBtn.titleLabel.font                                     = [UIFont boldSystemFontOfSize:25];
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
        self.cropBtn = choseCropNoticeBtn;
        [choseCropNoticeBtn setTitle:@"裁剪" forState:UIControlStateNormal];
        [choseCropNoticeBtn setTitleColor:[UIColor navigationBarColor] forState:UIControlStateNormal];
        choseCropNoticeBtn.titleLabel.font                            = [UIFont systemFontOfSize:17];
        [effectView.contentView addSubview:choseCropNoticeBtn];
        choseCropNoticeBtn.translatesAutoresizingMaskIntoConstraints  = NO;
        [choseCropNoticeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(noticeBtn.mas_bottom).offset(20);
            make.centerX.equalTo(self.view);
        }];
    }

    // 添加裁剪图片
    {
        ChoseCropView *cropView = [[ChoseCropView alloc] init];
        self.cropView = cropView;
        [self.view addSubview:cropView];
        cropView.translatesAutoresizingMaskIntoConstraints = NO;
        [cropView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(choseCropNoticeBtn.mas_bottom).offset(10);
            make.bottom.equalTo(self.view);
        }];
        
        __weak typeof(self) ws = self;
        [cropView setDidChoseImage:^(UIImage *choseToCrop, CropShapeStyle shape) {
            [ws cropWithShapeStyle:shape andImage:choseToCrop];
        }];
    }
}

- (void)cropWithShapeStyle:(CropShapeStyle)style andImage:(UIImage *)image
{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.userOriginBtn.alpha = .0;
        self.cropBtn.alpha = .0;
        self.cropView.alpha = .0;
       
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            self.effectView.alpha = .0;
        }];
    }];
    
    switch (style) {
        case CropShapeStyleCircle:
        {
            [self drawCircleAndAnimate];
        }
            break;
        case CropShapeStyleRect:
        {
            [self drawRectAndAnimate];
        }
            break;
        case CropShapeStyleStart:
        {
            [self drawRoundRectAndAnimate];
        }
            break;
        case CropShapeStyleTaoxin:
        {
            [self drawStartRectAndAnimate];
        }
            break;
        case CropShapeStyleTrangle:
        {
            [self drawTaoxinAndAnimate];
        }
            break;
        case CropShapeStyleRoundRect:
        {
            [self drawTrangleAndAnimate];
        }
            break;
    }
}

#pragma mark --- Animate Method
- (void)drawCircleAndAnimate
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.view.width / 2, self.view.width / 2)];
    layer.path = circlePath.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 3;
    layer.frame = CGRectMake(0, 0, self.view.width/2, self.view.width/2);
    layer.position = CGPointMake(self.view.width/2, self.view.height/2);
    layer.strokeColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    
    
}

- (void)drawRectAndAnimate
{

}

- (void)drawRoundRectAndAnimate
{

}

- (void)drawStartRectAndAnimate
{

}

- (void)drawTaoxinAndAnimate
{

}

- (void)drawTrangleAndAnimate
{
    
}

#pragma mark --- UIScrollViewDelegate Method
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.backImageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    self.backImageView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                            scrollView.contentSize.height * 0.5 + offsetY);
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{

}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{

}

@end






