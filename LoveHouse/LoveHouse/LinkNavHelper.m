//
//  LinkNavHelper.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "LinkNavHelper.h"
#import "ECSlidingViewController.h"
@implementation LinkNavHelper
WLSingletonM(Helper)
- (void)linkToMiddleVc:(UIViewController *)vc
{
    self.slidingVC.topViewController = vc;
    [vc.view addGestureRecognizer:self.slidingVC.panGesture];
    [self.slidingVC resetTopViewAnimated:YES];
    
}
@end
