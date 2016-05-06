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
#import "Message.h"
@interface HouseViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) HeadPhotoView *photoView;
@end

@implementation HouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self createFakeData];
}

- (void)createFakeData
{
    self.dataSource = [NSMutableArray array];
    NSArray *fakeTexts = @[
                           @"睡了吗?",
                           @"嗯啊～     我要睡午觉去了 好困呀",
                           @"第一天和姐姐逛了会 然后去了舅舅家  第二天 在家里 然后去了奶奶家    第三天在家里  然后回学校",
                           @"睡了吗?",
                           @"嗯啊～     我要睡午觉去了 好困呀",
                           @"第一天和姐姐逛了会 然后去了舅舅家  第二天 在家里 然后去了奶奶家    第三天在家里  然后回学校",
                           @"睡了吗?",
                           @"嗯啊～     我要睡午觉去了 好困呀",
                           @"第一天和姐姐逛了会 然后去了舅舅家  第二天 在家里 然后去了奶奶家    第三天在家里  然后回学校",
                           @"睡了吗?",
                           @"嗯啊～     我要睡午觉去了 好困呀",
                           @"第一天和姐姐逛了会 然后去了舅舅家  第二天 在家里 然后去了奶奶家    第三天在家里  然后回学校"
                           ];
    for (int i = 0; i < 12; i++) {
        Message *message = [[Message alloc] init];
        [self.dataSource addObject:message];
        message.textContent = fakeTexts[i];
    }
    
}

- (void)setupUI
{
    self.title = @"爱情小屋";
    self.photoView = [HeadPhotoView create];
    self.photoView.frame = CGRectMake(0, 0, self.view.width, 200);
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.width, 200)];
    self.tableView.bounces = NO;
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
    return self.dataSource.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        SendMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SendMessageCell"];
         return cell;
    }
    if (indexPath.row % 2) {
        RightReplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightReplyViewCell"];
        cell.message = self.dataSource[indexPath.row - 1];
        return cell;
    } else {
        LeftReplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftReplyViewCell"];
        cell.message = self.dataSource[indexPath.row - 1];
        return cell;
    }
   
}


@end
