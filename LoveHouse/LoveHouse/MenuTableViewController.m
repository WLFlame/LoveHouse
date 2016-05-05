//
//  MenuTableViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/26.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuItemCell.h"
#import "MenuHeaderCell.h"
#import <ChameleonFramework/Chameleon.h>
#import "HouseViewController.h"
#import "AlbumViewController.h"
#import "HouseDetailViewController.h"
#import "ChatRecordViewController.h"
#import "SettingViewController.h"
#import "HouseSummaryViewController.h"
@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark -- 懒加载

- (UINavigationController *)houseSummaryVc
{
    if (!_houseSummaryVc) {
        HouseSummaryViewController *summaryVc = [[UIStoryboard storyboardWithName:@"LoveHouse" bundle:nil] instantiateViewControllerWithIdentifier:@"HouseSummaryViewController"];
        _houseSummaryVc = [[UINavigationController alloc] initWithRootViewController:summaryVc];
    }
    return _houseSummaryVc;
}

- (UINavigationController *)houseVc
{
    if (!_houseVc) {
        _houseVc = [[UINavigationController alloc] initWithRootViewController:[[HouseViewController alloc] init]];
    }
    return _houseVc;
}

- (UINavigationController *)albumVc
{
    if (!_albumVc) {
        _albumVc = [[UINavigationController alloc] initWithRootViewController:[[AlbumViewController alloc] init]];
    }
    return _albumVc;
}

- (UINavigationController *)houseDetailVc
{
    if (!_houseDetailVc) {
        _houseDetailVc = [[UINavigationController alloc] initWithRootViewController:[[HouseDetailViewController alloc] init]];
    }
    return _houseDetailVc;
}

- (UINavigationController *)chatRecordVc
{
    if (!_chatRecordVc) {
        _chatRecordVc = [[UINavigationController alloc] initWithRootViewController:[[ChatRecordViewController alloc] init]];
    }
    return _chatRecordVc;
}

- (UINavigationController *)settingVc
{
    if (!_settingVc) {
        SettingViewController *settingVc = [[UIStoryboard storyboardWithName:@"LoveHouse" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingViewController"];
        _settingVc = [[UINavigationController alloc] initWithRootViewController:settingVc];
    }
    return _settingVc;
}



- (void)setupUI
{
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuItemCell" bundle:nil] forCellReuseIdentifier:@"MenuItemCell"];
     [self.tableView registerNib:[UINib nibWithNibName:@"MenuHeaderCell" bundle:nil] forCellReuseIdentifier:@"MenuHeaderCell"];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    NSArray *colors = [NSArray arrayOfColorsFromImage:[UIImage imageNamed:@"1"] withFlatScheme:YES];
    self.view.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleTopToBottom withFrame:[UIScreen mainScreen].bounds andColors:colors];
    self.tableView.separatorColor = [UIColor flatWhiteColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            MenuHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuHeaderCell"];
            return cell;
        }
            break;
        case 1:
        {
            MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell"];
            cell.lbMenuItem.text = @"日记本";
            return cell;
        }
            break;
        case 2:
        {
            MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell"];
            cell.lbMenuItem.text = @"私密相册";
            return cell;
        }
            break;
        case 3:
        {
            MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell"];
            cell.lbMenuItem.text = @"纪念日";
            return cell;
        }
            break;
        case 4:
        {
            MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell"];
            cell.lbMenuItem.text = @"小屋详情";
            return cell;
        }
            break;
        default:
        {
            MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell"];
            cell.lbMenuItem.text = @"设置";
            return cell;
        }
            break;
    }

   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 90;
    } else {
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            // 小屋
            [[LinkNavHelper sharedHelper] linkToMiddleVc:self.houseVc];
        }
            break;
        case 1:
        {
            // 日记本
            [[LinkNavHelper sharedHelper] linkToMiddleVc:self.chatRecordVc];
        }
            break;
        case 2:
        {
            // 私密相册
            [[LinkNavHelper sharedHelper] linkToMiddleVc:self.albumVc];
        }
            break;
        case 3:
        {
            // 纪念日
            [[LinkNavHelper sharedHelper] linkToMiddleVc:self.houseDetailVc];
        }
            break;
        case 4:
        {
            // 小屋详情
            [[LinkNavHelper sharedHelper] linkToMiddleVc:self.houseSummaryVc];
        }
            break;
        default:
        {
            // 设置
            [[LinkNavHelper sharedHelper] linkToMiddleVc:self.settingVc];
        }
            break;
    }
}

@end
