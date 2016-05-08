//
//  HouseDetailViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "HouseDetailViewController.h"
#import "HouseDetailHeaderView.h"
#import "TimeLineCell.h"
@interface HouseDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) HouseDetailHeaderView *headerView;
@property (nonatomic, strong) UITableView *memoryTableView;
@end

@implementation HouseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (HouseDetailHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = LoadViewFromNib(@"HouseDetailHeaderView");
        _headerView.frame = CGRectMake(0, 64, self.view.width, 140);
    }
    return _headerView;
}

- (UITableView *)memoryTableView
{
    if (!_memoryTableView) {
        _memoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 204, self.view.width, self.view.height - 204) style:UITableViewStylePlain];
        _memoryTableView.delegate = self;
        _memoryTableView.dataSource = self;
        _memoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _memoryTableView.rowHeight = 60;
        [_memoryTableView registerNib:[UINib nibWithNibName:@"TimeLineCell" bundle:nil] forCellReuseIdentifier:@"TimeLineCell"];
    }
    return _memoryTableView;
}

- (void)configureUI
{
    self.title = @"纪念日";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.memoryTableView];
}

#pragma mark --- UITableViewDataSource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeLineCell"];
    cell.text = @"今天是我们的纪念日";
    return cell;
}

#pragma mark --- UITableViewDelegate Method

@end


















