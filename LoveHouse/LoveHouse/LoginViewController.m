//
//  LoginViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/23.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "LoginViewController.h"
#import <ChameleonFramework/Chameleon.h>
#import "ForgetPasswordContainerView.h"
#import "RegisterContainerView.h"

typedef NS_ENUM(NSUInteger, LoginState) {
    LoginStateLogin = 0,
    LoginStateRegister,
    LoginStateForgetPwd
};

@interface LoginViewController () <ForgetPasswordContainerViewDelegate, RegisterContainerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UITextField *fieldUsername;
@property (nonatomic, strong) UITextField *fieldPassword;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) ForgetPasswordContainerView *forgetPwdContainer;
//@property (nonatomic, strong) UIVisualEffectView *forgetVisualView;
@property (nonatomic, strong) RegisterContainerView *registerContainer;
//@property (nonatomic, strong) UIVisualEffectView *registerVisualView;
@property (nonatomic, assign) LoginState loginState;
@property (nonatomic, strong) UIImagePickerController *picker;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIImagePickerController *)picker
{
    if (!_picker) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.allowsEditing = YES;
        _picker.delegate = self;
    }
    return _picker;
}


- (ForgetPasswordContainerView *)forgetPwdContainer
{
    if (!_forgetPwdContainer) {
//        UIVisualEffectView *visualView = [[UIVisualEffectView alloc] initWithEffect:[[UIBlurEffect alloc] init]];
//        _forgetVisualView = visualView;
//        visualView.frame = self.view.bounds;
//        [self.view addSubview:visualView];
        ForgetPasswordContainerView *forgetContainerView = [[ForgetPasswordContainerView alloc] init];
        self.forgetPwdContainer = forgetContainerView;
        self.forgetPwdContainer.delegate = self;
        [self.view addSubview:forgetContainerView];
//        [visualView.contentView addSubview:forgetContainerView];
        forgetContainerView.sd_layout
        .leftSpaceToView(self.view, -(self.view.width - 60))
        .rightSpaceToView(self.view, self.view.width)
        .heightIs(self.view.height / 2 - 40)
        .topSpaceToView(self.view, self.view.height / 4);
    }
   
    return _forgetPwdContainer;
}

- (RegisterContainerView *)registerContainer
{
    if (!_registerContainer) {
//        UIVisualEffectView *visualView = [[UIVisualEffectView alloc] initWithEffect:[[UIBlurEffect alloc] init]];
//        _registerVisualView = visualView;
//        visualView.frame = self.view.bounds;
//        [self.view addSubview:visualView];
        RegisterContainerView *registerContainer = [[RegisterContainerView alloc] init];
        self.registerContainer = registerContainer;
        self.registerContainer.delegate = self;
        [self.view addSubview:registerContainer];
        registerContainer.sd_layout
        .leftSpaceToView(self.view, self.view.width)
        .rightSpaceToView(self.view, -(self.view.width - 60))
        .heightIs(self.view.height / 2 + 40)
        .topSpaceToView(self.view, self.view.height / 4);
    }
    
    return _registerContainer;
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
     CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    __weak typeof(self) ws = self;
    switch (self.loginState) {
        case LoginStateLogin:
        {
            [UIView animateWithDuration:duration animations:^{
                ws.containerView.sd_layout
                .topSpaceToView(self.view, self.view.height / 4);
                [ws.containerView updateLayout];
            }];
        }
            break;
        case LoginStateForgetPwd:
        {
            [UIView animateWithDuration:duration animations:^{
                ws.forgetPwdContainer.sd_layout
                .topSpaceToView(self.view, self.view.height / 4 );
                [ws.forgetPwdContainer updateLayout];
            }];
        }
            break;
        default:
        {
            [UIView animateWithDuration:duration animations:^{
                ws.registerContainer.sd_layout
                .topSpaceToView(self.view, self.view.height / 4);
                [ws.registerContainer updateLayout];
            }];
        }
            break;
    }
   
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    __weak typeof(self) ws = self;
    switch (self.loginState) {
        case LoginStateLogin:
        {
            CGRect containerKeywindowRect = [[UIApplication sharedApplication].keyWindow convertRect:self.containerView.frame fromView:self.view];
            CGRect insetRect = CGRectIntersection(containerKeywindowRect, keyboardFrame);
            [UIView animateWithDuration:duration animations:^{
                ws.containerView.sd_layout
                .topSpaceToView(self.view, self.view.height / 4 - insetRect.size.height - 15);
                [ws.containerView updateLayout];
            }];
        }
            break;
        case LoginStateRegister:
        {
            CGRect containerKeywindowRect = [[UIApplication sharedApplication].keyWindow convertRect:self.registerContainer.frame fromView:self.view];
            CGRect insetRect = CGRectIntersection(containerKeywindowRect, keyboardFrame);
            [UIView animateWithDuration:duration animations:^{
                ws.registerContainer.sd_layout
                .topSpaceToView(self.view, self.view.height / 4 - insetRect.size.height - 15);
                [ws.registerContainer updateLayout];
            }];
        }
            break;
        default:
        {
            CGRect containerKeywindowRect = [[UIApplication sharedApplication].keyWindow convertRect:self.forgetPwdContainer.frame fromView:self.view];
            CGRect insetRect = CGRectIntersection(containerKeywindowRect, keyboardFrame);
            [UIView animateWithDuration:duration animations:^{
                ws.forgetPwdContainer.sd_layout
                .topSpaceToView(self.view, self.view.height / 4 - insetRect.size.height - 15);
                [ws.forgetPwdContainer updateLayout];
            }];
        }
            break;
    }
   
}

- (void)setupUI
{
    
    [self.view addSubview:self.registerContainer];
    [self.view addSubview:self.forgetPwdContainer];
    
    self.view.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleTopToBottom withFrame:self.view.bounds andColors:@[[UIColor colorWithHexString:@"f6cee3"], [UIColor colorWithHexString:@"8ef7f8"]]];
    UIView *containerView = [[UIView alloc] init];
    self.containerView = containerView;
    containerView.layer.cornerRadius = 15;
    containerView.layer.masksToBounds = YES;
    containerView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.75].CGColor;
    containerView.layer.borderWidth = .5;
    containerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self.view sd_addSubviews:@[containerView]];
    containerView.sd_layout
    .leftSpaceToView(self.view, 30)
    .rightSpaceToView(self.view, 30)
    .heightRatioToView(self.view, 0.5)
    .topSpaceToView(self.view, self.view.height / 4);
  
    _avatar = [[UIImageView alloc] init];
    _avatar.image = [UIImage imageNamed:@"loginDefaultAvatar"];
    _avatar.layer.cornerRadius = 75 / 2;
    _avatar.layer.masksToBounds = YES;
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor colorWithHexString:@"8ef7f8"];
    loginBtn.layer.cornerRadius = 7.5;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.75].CGColor;
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
   
    
    _fieldUsername = [[UITextField alloc] init];
    _fieldUsername.borderStyle = UITextBorderStyleNone;
    _fieldUsername.font = [UIFont systemFontOfSize:14];
    _fieldUsername.textColor = [UIColor colorWithHexString:@"303030"];
    _fieldUsername.placeholder = @"手机号";
    _fieldUsername.textAlignment = NSTextAlignmentCenter;
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHexString:@"f5cee3"];
    
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithHexString:@"f5cee3"];
    
    _fieldPassword = [[UITextField alloc] init];
    _fieldPassword.borderStyle = UITextBorderStyleNone;
    _fieldPassword.textColor = [UIColor colorWithHexString:@"303030"];
    _fieldPassword.secureTextEntry = YES;
    _fieldPassword.placeholder = @"密码";
    _fieldPassword.font = [UIFont systemFontOfSize:14];
    _fieldPassword.textAlignment = NSTextAlignmentCenter;
    
    UIButton *forgetBtn = [[UIButton alloc] init];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [forgetBtn setTitleColor:[UIColor colorWithHexString:@"f5cee3"] forState:UIControlStateNormal];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
     [forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *registerBtn = [[UIButton alloc] init];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [registerBtn setTitleColor:[UIColor colorWithHexString:@"f5cee3"] forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
     registerBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [containerView sd_addSubviews:@[_avatar, loginBtn, _fieldUsername, _fieldPassword, line1, line2, forgetBtn, registerBtn]];
    
    _avatar.sd_layout
    .topSpaceToView(containerView, 25)
    .widthIs(75)
    .heightIs(75)
    .centerXEqualToView(containerView);
    
    loginBtn.sd_layout
    .bottomSpaceToView(containerView, 25)
    .centerXEqualToView(containerView)
    .widthRatioToView(containerView, 0.5)
    .heightIs(40);
    
    
    
    _fieldUsername.sd_layout
    .leftSpaceToView(containerView, 30)
    .rightSpaceToView(containerView, 30)
    .topSpaceToView(self.avatar, 15)
    .heightIs(40);
    
    
    line1.sd_layout
    .leftSpaceToView(containerView, 25)
    .rightSpaceToView(containerView, 25)
    .topSpaceToView(_fieldUsername, 3)
    .heightIs(.5);
    
    _fieldPassword.sd_layout
    .leftSpaceToView(containerView, 30)
    .rightSpaceToView(containerView, 30)
    .topSpaceToView(line1, 15)
    .heightIs(40);
    
    line2.sd_layout
    .leftSpaceToView(containerView, 25)
    .rightSpaceToView(containerView, 25)
    .topSpaceToView(_fieldPassword, 3)
    .heightIs(.5);
    
    forgetBtn.sd_layout
    .topSpaceToView(line2, 10)
    .leftEqualToView(line2)
    .heightIs(15)
    .widthIs(100);
    
    registerBtn.sd_layout
    .topSpaceToView(line2, 10)
    .rightEqualToView(line2)
    .heightIs(15)
    .widthIs(100);
}

#pragma mark -- Action Method
- (void)loginBtnClick
{
    if ([self.fieldUsername.text isBlankString]) {
        TTAlert(@"请输入用户名");
        return;
    }
    
    if ([self.fieldPassword.text isBlankString]) {
        TTAlert(@"请输入密码");
        return;
    }
    
    [self.view showHUD];
    __weak typeof(self) ws = self;
    [AVUser logInWithUsernameInBackground:self.fieldUsername.text password:self.fieldPassword.text block:^(AVUser *user, NSError *error) {
        [ws.view hideHUD];
        if (user != nil) {
//            HouseViewController *houseVc = [[HouseViewController alloc] init];
//            [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:houseVc];
        } else {
            TTAlertError(error);
            TTAlert(@"用户名或密码错误");
        }
    }];
}

- (void)forgetBtnClick
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.alpha = 0;
        self.forgetPwdContainer.sd_layout
        .leftSpaceToView(self.view, 30)
        .rightSpaceToView(self.view, 30);
        [self.forgetPwdContainer updateLayout];
    }];
    self.loginState = LoginStateForgetPwd;
}

- (void)registerBtnClick
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.alpha = 0;
        self.registerContainer.sd_layout
        .leftSpaceToView(self.view, 30)
        .rightSpaceToView(self.view, 30);
        [self.registerContainer updateLayout];
    }];
    self.loginState = LoginStateRegister;
}

#pragma mark --- ForgetPasswordContainerViewDelegate
- (void)forgetPasswordContainerViewDidClickSure:(ForgetPasswordContainerView *)container
{
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.alpha = 1;
        self.forgetPwdContainer.sd_layout
        .leftSpaceToView(self.view, -(self.view.width - 60))
        .rightSpaceToView(self.view, self.view.width);
        [self.forgetPwdContainer updateLayout];
        
    } completion:^(BOOL finished) {
//        [self.forgetPwdContainer removeFromSuperview];
        self.loginState = LoginStateLogin;
        
    }];
}

- (void)forgetPasswordContainerViewDidClickBack:(ForgetPasswordContainerView *)container
{
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.alpha = 1;
        self.forgetPwdContainer.sd_layout
        .leftSpaceToView(self.view, -(self.view.width - 60))
        .rightSpaceToView(self.view, self.view.width);
        [self.forgetPwdContainer updateLayout];
        
    } completion:^(BOOL finished) {
        //        [self.forgetPwdContainer removeFromSuperview];
        self.loginState = LoginStateLogin;
        
    }];
}

#pragma mark --- RegisterContainerViewDelegate
- (void)registerContainerViewDidClickSure:(RegisterContainerView *)container
{
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.alpha =  1;
        self.registerContainer.sd_layout
        .leftSpaceToView(self.view, self.view.width)
        .rightSpaceToView(self.view,  -(self.view.width - 60));
        [self.registerContainer updateLayout];
    } completion:^(BOOL finished) {
//        [self.registerContainer removeFromSuperview];
        self.loginState = LoginStateLogin;
    }];
}

- (void)registerContainerViewDidClickBack:(RegisterContainerView *)container
{
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.alpha =  1;
        self.registerContainer.sd_layout
        .leftSpaceToView(self.view, self.view.width)
        .rightSpaceToView(self.view,  -(self.view.width - 60));
        [self.registerContainer updateLayout];
    } completion:^(BOOL finished) {
        //        [self.registerContainer removeFromSuperview];
        self.loginState = LoginStateLogin;
    }];
}

- (void)registerContainerViewDidChoseAvatar:(RegisterContainerView *)container
{
    __weak typeof(self) ws = self;
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"选择" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ws.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [ws presentViewController:self.picker animated:YES completion:nil];
    }]];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ws.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [ws presentViewController:ws.picker animated:YES completion:nil];
    }]];
    
    [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [ws removeFromParentViewController];
        [ws.view removeFromSuperview];
    }]];
    [self presentViewController:alertVc animated:YES completion:nil];
    
    
}


#pragma mark --- UIImagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *avatar = info[UIImagePickerControllerOriginalImage];
    avatar = [avatar resizedImage:CGSizeMake(300, 300) interpolationQuality:kCGInterpolationMedium];
    self.registerContainer.avatarView.image = avatar;
     [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
