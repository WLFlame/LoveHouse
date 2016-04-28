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
#import "HeadPhotoView.h"
#import "SendMessageView.h"
#import "RightReplyViewCell.h"
#import "LeftReplyViewCell.h"
@interface HouseViewController ()

@end

@implementation HouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.title = @"爱情小屋";
    HeadPhotoView *head = [HeadPhotoView create];
    head.frame = CGRectMake(0, 0, self.view.width, 200);
    self.tableView.tableHeaderView = head;

}


@end
