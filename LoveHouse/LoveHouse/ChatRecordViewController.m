//
//  ChatRecordViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "ChatRecordViewController.h"
#import "DiaryTableViewCell.h"
#import "EditDiaryViewController.h"
#import "EditArticleViewController.h"
#import "WPViewController.h"
@interface ChatRecordViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation ChatRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (void)configureUI
{
    self.title = @"日记本";
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.backgroundColor = [UIColor flatWhiteColor];
    table.rowHeight = 70;
    table.tableFooterView = [[UIView alloc] init];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table = table;
    [table registerNib:[UINib nibWithNibName:@"DiaryTableViewCell" bundle:nil] forCellReuseIdentifier:@"DiaryTableViewCell"];
    [self.view addSubview:self.table];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"记录" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeTop];
    }
    
}


- (void)edit
{
    WPViewController *editDiary = [[WPViewController alloc] initWithMode:kWPEditorViewControllerModeEdit];
    UINavigationController *editNav = [[UINavigationController alloc] initWithRootViewController:editDiary];
    
    [self presentViewController:editNav animated:YES completion:nil];
}

#pragma mark --- UITableViewDataSource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiaryTableViewCell"];
    return cell;
}
#pragma mark --- UITableViewDelegate Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EditArticleViewController *editDiary = [[EditArticleViewController alloc] initWithMode:kWPEditorViewControllerModePreview];
    [self.navigationController pushViewController:editDiary animated:YES];
}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewCellEditingStyleDelete;
//}
//
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

@end
