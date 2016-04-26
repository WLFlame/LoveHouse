//
//  ForgetPasswordself.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/23.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "ForgetPasswordContainerView.h"

@interface ForgetPasswordContainerView()
@property (nonatomic, strong) UIButton *btnSendVerifyCode;
@property (nonatomic, strong) UITextField *fieldTel;
@property (nonatomic, strong) UITextField *fieldPwd;
@property (nonatomic, strong) UITextField *fieldVerifyCode;
@property (nonatomic, copy) NSString *verifyCode;
@property (nonatomic, assign) NSInteger timeseconds;
@property (nonatomic, strong) NSTimer *timer;
@end


@implementation ForgetPasswordContainerView

- (instancetype)init
{
    if (self = [super init]) {
        self.timeseconds = 60;
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.75].CGColor;
    self.layer.borderWidth = .5;
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    UIButton *back = [[UIButton alloc] init];
    [back setImage:[UIImage imageNamed:@"rightback"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *avatar = [[UIImageView alloc] init];
    avatar.image = [UIImage imageNamed:@"loginDefaultAvatar"];
    avatar.layer.cornerRadius = 75 / 2;
    avatar.layer.masksToBounds = YES;
    avatar.transform = CGAffineTransformMakeRotation(M_PI * 2);
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"确定" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor colorWithHexString:@"8ef7f8"];
    loginBtn.layer.cornerRadius = 7.5;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.75].CGColor;
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UITextField *fieldUsername = [[UITextField alloc] init];
    self.fieldTel = fieldUsername;
    fieldUsername.borderStyle = UITextBorderStyleNone;
    fieldUsername.font = [UIFont systemFontOfSize:14];
    fieldUsername.textColor = [UIColor colorWithHexString:@"303030"];
    fieldUsername.placeholder = @"手机号";
    fieldUsername.textAlignment = NSTextAlignmentCenter;
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHexString:@"f5cee3"];
    
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithHexString:@"f5cee3"];
    
    UIView *line3 = [[UIView alloc] init];
    line3.backgroundColor = [UIColor colorWithHexString:@"f5cee3"];
    
    UIButton *sendVerifyCodeBtn = [[UIButton alloc] init];
    sendVerifyCodeBtn.layer.cornerRadius = 3;
    sendVerifyCodeBtn.layer.masksToBounds = YES;
    [sendVerifyCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    sendVerifyCodeBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    sendVerifyCodeBtn.backgroundColor = [UIColor colorWithHexString:@"8ef7f8"];
    [sendVerifyCodeBtn addTarget:self action:@selector(sendVerifyCode) forControlEvents:UIControlEventTouchUpInside];
    self.btnSendVerifyCode = sendVerifyCodeBtn;
    
    UITextField *fieldPassword = [[UITextField alloc] init];
    self.fieldPwd = fieldPassword;
    fieldPassword.borderStyle = UITextBorderStyleNone;
    fieldPassword.textColor = [UIColor colorWithHexString:@"303030"];
    fieldPassword.secureTextEntry = YES;
    fieldPassword.placeholder = @"密码";
    fieldPassword.font = [UIFont systemFontOfSize:14];
    fieldPassword.textAlignment = NSTextAlignmentCenter;
    
   
    UITextField *fieldVerifyCode = [[UITextField alloc] init];
    self.fieldVerifyCode = fieldVerifyCode;
    fieldVerifyCode.borderStyle = UITextBorderStyleNone;
    fieldVerifyCode.textColor = [UIColor colorWithHexString:@"303030"];
    fieldVerifyCode.secureTextEntry = YES;
    fieldVerifyCode.placeholder = @"验证码";
    fieldVerifyCode.font = [UIFont systemFontOfSize:14];
    fieldVerifyCode.textAlignment = NSTextAlignmentCenter;
    
    
    [self sd_addSubviews:@[avatar, loginBtn, fieldUsername, fieldPassword, line1, line2, line3, fieldVerifyCode, sendVerifyCodeBtn, back]];
    
    back.sd_layout
    .topSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .widthIs(15)
    .heightIs(15);
    
    avatar.sd_layout
    .topSpaceToView(self, 25)
    .widthIs(75)
    .heightIs(75)
    .centerXEqualToView(self);
    
    loginBtn.sd_layout
    .bottomSpaceToView(self, 25)
    .centerXEqualToView(self)
    .widthRatioToView(self, 0.5)
    .heightIs(40);
    
    fieldUsername.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(avatar, 15)
    .heightIs(40);
    
    
    line1.sd_layout
    .leftSpaceToView(self, 25)
    .rightSpaceToView(self, 25)
    .topSpaceToView(fieldUsername, 3)
    .heightIs(.5);
    
    fieldPassword.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(line1, 15)
    .heightIs(40);
    
    line2.sd_layout
    .leftSpaceToView(self, 25)
    .rightSpaceToView(self, 25)
    .topSpaceToView(fieldPassword, 3)
    .heightIs(.5);
    
    fieldVerifyCode.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(line2, 15)
    .heightIs(40);
    
    line3.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(fieldVerifyCode, 3)
    .heightIs(.5);
    
    sendVerifyCodeBtn.sd_layout
    .rightSpaceToView(self, 35)
    .heightIs(25)
    .centerYEqualToView(fieldVerifyCode)
    .widthIs(70);
}

- (void)sendVerifyCode
{
    if ([self.fieldTel.text isBlankString]) {
        TTAlert(@"手机号不能为空");
        return;
    }
    
    if (![self.fieldTel.text isMobileNumber]) {
        TTAlert(@"请输入正确手机号");
        return;
    }
    
    
    self.btnSendVerifyCode.enabled = NO;
    __weak typeof(self) ws = self;
    
    [AVUser requestPasswordResetWithPhoneNumber:self.fieldTel.text block:^(BOOL succeeded, NSError *error) {
        // 发送失败可以查看 error 里面提供的信息
        if (error) {
            TTAlertError(error);
        } else {
            ws.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timescecondsDown) userInfo:nil repeats:YES];
        }

    }];
}

- (void)timescecondsDown
{
    if (self.timeseconds > 1) {
        self.timeseconds--;
        [self.btnSendVerifyCode setTitle:[NSString stringWithFormat:@"%ld", (long)self.timeseconds] forState:UIControlStateNormal];
    } else {
        [self.timer invalidate];
        [self.btnSendVerifyCode setTitle:@"发送验证码" forState:UIControlStateNormal];
        self.btnSendVerifyCode.enabled = YES;
    }
}

- (void)backBtnClick
{
    if ([self.delegate respondsToSelector:@selector(forgetPasswordContainerViewDidClickBack:)]) {
        [self.delegate forgetPasswordContainerViewDidClickBack:self];
    }
}

- (void)loginBtnClick
{
    
    if ([self.verifyCode isBlankString]) {
        TTAlert(@"请先获取验证码");
        return;
    }
    
    if ([self.fieldVerifyCode.text isBlankString]) {
        TTAlert(@"请输入验证码");
        return;
    }
    
    //    if (![self.fieldVerifyCode.text isEqualToString:self.verifyCode]) {
    //        TTAlert(@"请输入正确验证码");
    //        return;
    //    }
    //
    if ([self.fieldPwd.text isBlankString]) {
        TTAlert(@"请输入密码");
        return;
    }
    [self showHUD];
    
    __weak typeof(self) ws = self;
    [AVUser resetPasswordWithSmsCode:self.fieldTel.text newPassword:self.fieldPwd.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            TTAlert(@"密码重设成功");
            if ([ws.delegate respondsToSelector:@selector(forgetPasswordContainerViewDidClickSure:)]) {
                [ws.delegate forgetPasswordContainerViewDidClickSure:ws];
            }
        } else {
            TTAlert(@"密码重置失败");
        }
    }];
   
}

@end
