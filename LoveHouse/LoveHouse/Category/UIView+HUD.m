//
//  UIView+HUD.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/24.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)
- (void)showHUD
{
    UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:[[UIBlurEffect alloc] init]];
    visual.frame = [UIScreen mainScreen].bounds;
    visual.tag = 1000;
    [self addSubview:visual];
    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeCookieTerminator tintColor:[UIColor colorWithHexString:@"f76483"]];
    [visual.contentView addSubview:activityIndicatorView];
    activityIndicatorView.center = CGPointMake(self.width/2, self.height/2);
    [activityIndicatorView startAnimating];
}

- (void)hideHUD
{
    [[self viewWithTag:1000] removeFromSuperview];
}
@end
