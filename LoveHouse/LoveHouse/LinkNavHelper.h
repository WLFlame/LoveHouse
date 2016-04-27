//
//  LinkNavHelper.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLSingletonH.h"
@class ECSlidingViewController;
@interface LinkNavHelper : NSObject
WLSingletonH(Helper)
@property (nonatomic, weak) ECSlidingViewController *slidingVC;
- (void)linkToMiddleVc:(UIViewController *)vc;
@end
