//
//  CHTCollectionViewWaterfallLayout.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/29.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CHTCollectionViewWaterfallLayoutItemRenderDirection) {
    CHTCollectionViewWaterfallLayoutItemRenderDirectionShortestFirst,
    CHTCollectionViewWaterfallLayoutItemRenderDirectionLeftToRight,
    CHTCollectionViewWaterfallLayoutItemRenderDirectionRightToLeft
};

extern NSString * _Nullable const CHTCollectionElementKindSectionHeader;
extern NSString * _Nullable const CHTCollectionElementKindSectionFooter;

@class CHTCollectionViewWaterfallLayout;

@protocol CHTCollectionViewWaterfallLayoutDelegate <NSObject>

@required
- (CGSize)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout * _Nonnull)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
@optional
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columCountForSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForHeaderInSection:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForFooterInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section;
@end

#pragma mark - CHTCollectionViewWaterfallLayout

@interface CHTCollectionViewWaterfallLayout : UICollectionViewLayout
@property (nonatomic, assign) NSInteger columnCount;
@property (nonatomic, assign) CGFloat minimumColumnSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign) UIEdgeInsets headerInset;
@property (nonatomic, assign) UIEdgeInsets footerInset;
@property (nonatomic, assign) UIEdgeInsets sectionInset;
@property (nonatomic, assign) CHTCollectionViewWaterfallLayoutItemRenderDirection itemRenderDirection;
@property (nonatomic, assign) CGFloat minimumContentHeight;
- (CGFloat)itemWidthInSectionAtIndex:(NSInteger)section;
@end




















