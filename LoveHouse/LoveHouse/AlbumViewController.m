//
//  AlbumViewController.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "AlbumViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "AlbumCell.h"
#import "AlbumReusableHeader.h"

@interface AlbumViewController () <UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic, strong) UICollectionView *albumCollectionView;
@property (nonatomic, strong) NSArray *fakeImageArray;
@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

#pragma mark --- Lazy Load
- (NSArray *)fakeImageArray
{
    if (!_fakeImageArray) {
        _fakeImageArray = [NSArray array];
        NSMutableArray *temp = [NSMutableArray array];
        for (int i = 0; i < 2; i ++) {
            for (int j = 1; j < 7; j++) {
                UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"fake%d.jpg", j]];
                if (img) {
                  [temp addObject:img];
                }

            }
        }
        _fakeImageArray = [temp copy];
    }
    return _fakeImageArray;
}

#pragma mark --- Private
- (void)configureUI
{
    self.title                               = @"相册";

    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset                      = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerHeight                      = 20;
    layout.footerHeight                      = 10;
    layout.minimumColumnSpacing              = 10;
    layout.minimumInteritemSpacing           = 10;

    self.albumCollectionView                 = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.albumCollectionView.backgroundColor = [UIColor flatWhiteColor];

    self.albumCollectionView.dataSource      = self;
    self.albumCollectionView.delegate        = self;
    [self.view addSubview:self.albumCollectionView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClick)];

    [self.albumCollectionView registerClass:[AlbumCell class] forCellWithReuseIdentifier:[AlbumCell reuseId]];
    [self.albumCollectionView registerClass:[AlbumReusableHeader class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:[AlbumReusableHeader reuseId]];
}

#pragma mark -- Action Method
- (void)rightItemClick
{
    
}

#pragma mark --- UICollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.fakeImageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumCell *albumcell = [collectionView dequeueReusableCellWithReuseIdentifier:[AlbumCell reuseId] forIndexPath:indexPath];
    albumcell.imageView.image = self.fakeImageArray[indexPath.row];
    return albumcell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    AlbumReusableHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:[AlbumReusableHeader reuseId] forIndexPath:indexPath];
    return header;
}

#pragma mark --- UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma CHTCollectionViewWaterfallLayout Delegate
- (CGSize)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout * _Nonnull)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath
{
    UIImage *album = self.fakeImageArray[indexPath.row];
    return album.size;
}

@end
