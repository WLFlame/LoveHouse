//
//  MenuTableViewController.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/26.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MenuTableViewController : UITableViewController
@property (nonatomic, strong) UINavigationController *houseSummaryVc;
@property (nonatomic, strong) UINavigationController *houseVc;
@property (nonatomic, strong) UINavigationController *albumVc;
@property (nonatomic, strong) UINavigationController *houseDetailVc;
@property (nonatomic, strong) UINavigationController *chatRecordVc;
@property (nonatomic, strong) UINavigationController *settingVc;
@end
