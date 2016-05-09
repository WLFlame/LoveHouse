//
//  EditDiaryViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/5/8.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "EditDiaryViewController.h"
#import "PlaceholderTextView.h"
#import "TitleInputAccessoryView.h"
#import "DiaryBottomCompleteView.h"
#import "DiaryContentAccessoryView.h"
#import "YYText.h"
#import "YYImage.h"
#import "CropImageViewController.h"
@interface EditDiaryViewController () <DiaryContentAccessoryViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, DiaryBottomCompleteViewDelegate>
@property (nonatomic, strong) UITextField *titleHeaderField;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) YYTextView *contentTextView;
@property (nonatomic, strong) DiaryContentAccessoryView *diaryContentAccessoryView;
@property (nonatomic, strong) UIImagePickerController *pickerController;
@property (nonatomic, strong) DiaryBottomCompleteView *completeView;
@end

@implementation EditDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.navigationController.navigationBarHidden = NO;
}

- (UIImagePickerController *)pickerController
{
    if (!_pickerController) {
        _pickerController = [[UIImagePickerController alloc] init];
        _pickerController.delegate = self;
        
    }
    return _pickerController;
}


- (void)configureUI
{
    {
        
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    UIColor *placeColor = [UIColor colorWithHexString:@"c5c5cc"];
    
    {
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        timeLabel.font = [UIFont boldSystemFontOfSize:12];
        timeLabel.textColor = placeColor;
        timeLabel.text = @"5月8日 星期天";
        [self.view addSubview:timeLabel];
        timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.top.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(10);
            make.height.mas_offset(17);
        }];
    }
    
    {
        UITextField *field = [[UITextField alloc] init];
        self.titleHeaderField = field;
        field.font = [UIFont boldSystemFontOfSize:20];
        NSMutableAttributedString *placeholderAttr = [[NSMutableAttributedString alloc] initWithString:@"标题(30字以内)"];
        [placeholderAttr addAttributes:@{
                                        NSFontAttributeName : [UIFont boldSystemFontOfSize:17],
                                        NSForegroundColorAttributeName : placeColor
                                        } range:NSMakeRange(0, 2)];
        [placeholderAttr addAttributes:@{
                                         NSFontAttributeName : [UIFont boldSystemFontOfSize:12],
                                         NSForegroundColorAttributeName : placeColor
                                         } range:NSMakeRange(2, 7)];
        field.attributedPlaceholder = placeholderAttr;
        [self.view addSubview:field];
        field.translatesAutoresizingMaskIntoConstraints = NO;
        [field mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.top.equalTo(self.timeLabel.mas_bottom).offset(15);
        }];
        
        field.inputAccessoryView = [TitleInputAccessoryView titleInputAccessory:^{
            [field resignFirstResponder];
        }];
    }
    
    {
        YYTextView *contentTextView = [[YYTextView alloc] init];
        self.contentTextView = contentTextView;
        [self.view addSubview:contentTextView];
        contentTextView.placeholderText = @"输入日记...";
        contentTextView.placeholderTextColor = placeColor;
        contentTextView.placeholderFont = [UIFont systemFontOfSize:14];
        contentTextView.font = [UIFont systemFontOfSize:14];
        contentTextView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        contentTextView.translatesAutoresizingMaskIntoConstraints = NO;
        [contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleHeaderField.mas_bottom).offset(10);
            make.left.equalTo(self.view).offset(8);
            make.right.equalTo(self.view).offset(-8);
            make.bottom.equalTo(self.view).offset(-10);
        }];
        
        self.diaryContentAccessoryView = [DiaryContentAccessoryView diaryContentAccessory:^{
            [contentTextView resignFirstResponder];
        }];
        self.diaryContentAccessoryView.delegate = self;
        contentTextView.inputAccessoryView = self.diaryContentAccessoryView;
    }
    
    {
        DiaryBottomCompleteView *completeView = LoadViewFromNib(@"DiaryBottomCompleteView");
        [self.view addSubview:completeView];
        self.completeView = completeView;
        completeView.delegate = self;
        completeView.translatesAutoresizingMaskIntoConstraints = NO;
        [completeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.height.mas_equalTo(44);
        }];
    }
}

#pragma mark --- DiaryContentAccessoryViewDelegate
- (void)diaryContentAccessoryViewClickChosePhoto:(DiaryContentAccessoryView *)view
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) ws = self;
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ws.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [ws presentViewController:ws.pickerController animated:YES completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
            ws.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [ws presentViewController:ws.pickerController animated:YES completion:nil];
        } else {
            TTAlert(@"摄像机不可用，请检查系统设置");
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

#pragma mark --- DiaryBottomCompleteViewDelegate
- (void)diaryBottomCompleteViewDidClickBack:(DiaryBottomCompleteView *)completeView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否保存" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 执行保存操作
         [self.navigationController popViewControllerAnimated:YES];
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)diaryBottomCompleteViewDidClickSave:(DiaryBottomCompleteView *)completeView
{
    
}

#pragma mark --- UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    Log(@"%@", info);
    __weak typeof(self) ws = self;
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *originImage = info[UIImagePickerControllerOriginalImage];
        CGFloat imageW = [self.contentTextView sizeThatFits:CGSizeMake(self.contentTextView.width, self.contentTextView.height)].width;
        CGFloat imageH = imageW / originImage.size.width * originImage.size.height;
        UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:originImage];
        NSMutableAttributedString *attributeStr = [NSMutableAttributedString yy_attachmentStringWithContent:originImage contentMode:UIViewContentModeCenter attachmentSize:CGSizeMake(imageW, imageH) alignToFont:self.contentTextView.font alignment:YYTextVerticalAlignmentCenter];
        self.contentTextView.attributedText = [attributeStr copy];
//        CGSize maxSize = CGSizeMake(imageW, CGFLOAT_MAX);
//        CGRect rect = [self.contentTextView.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.contentTextView.font} context:nil];
//        imageView.frame = CGRectMake(0, rect.size.height + 10, imageW, imageH);
//        [ws.contentTextView addSubview:imageView];
//        UIBezierPath *path = [UIBezierPath bezierPathWithRect:imageView.frame];
//        self.contentTextView.exclusionPaths = @[path];
    }];
}


@end
