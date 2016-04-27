//
//  HouseViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/26.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "HouseViewController.h"
#import "LeftReplyViewCell.h"
#import "RightReplyViewCell.h"
#import "SendMessageCell.h"
#import "HeadPhotoView.h"

@interface HouseViewController ()

@property (nonatomic, strong) HeadPhotoView *photoView;
@end

@implementation HouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.title = @"爱情小屋";
    self.photoView = [HeadPhotoView create];
    self.photoView.frame = CGRectMake(0, 0, self.view.width, 200);
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.width, 200)];
    [self.tableView.tableHeaderView addSubview:self.photoView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 70;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"SendMessageCell" bundle:nil] forCellReuseIdentifier:@"SendMessageCell"];
     [self.tableView registerNib:[UINib nibWithNibName:@"RightReplyViewCell" bundle:nil] forCellReuseIdentifier:@"RightReplyViewCell"];
     [self.tableView registerNib:[UINib nibWithNibName:@"LeftReplyViewCell" bundle:nil] forCellReuseIdentifier:@"LeftReplyViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        SendMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SendMessageCell"];
         return cell;
    }
    if (indexPath.row % 2) {
        RightReplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightReplyViewCell"];
        return cell;
    } else {
        LeftReplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftReplyViewCell"];
        return cell;
    }
   
}


@end
