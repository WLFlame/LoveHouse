//
//  ChoseCropView.h
//  LoveHouse
//
//  Created by ywl on 16/5/9.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CropShapeStyle) {
    CropShapeStyleCircle,
    CropShapeStyleRect,
    CropShapeStyleRoundRect,
    CropShapeStyleStart,
    CropShapeStyleTaoxin,
    CropShapeStyleTrangle
};

@interface ChoseCropView : UIView
@property (nonatomic, copy) void(^didChoseImage)(UIImage *image, CropShapeStyle shape);
@end
