//
//  LoveHouseMarco.h
//  LoveHouse
//
//  Created by wanli.yang on 16/4/28.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#ifndef LoveHouseMarco_h
#define LoveHouseMarco_h
#define LoadViewFromNib(nibName) [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil].lastObject
#ifdef DEBUG
#define Log(...) NSLog(__VA_ARGS__)
#define LogFunc NSLog(@"%s",__func__)
#else
#define Log(...)
#define LogFunc
#endif
#endif /* LoveHouseMarco_h */
