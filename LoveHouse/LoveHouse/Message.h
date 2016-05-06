//
//  Message.h
//  LoveHouse
//
//  Created by ywl on 16/5/6.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MessageType) {
    MessageTypeText,
    MessageTypeImage,
    MessageTypeVoice
};

@interface Message : NSObject
@property (nonatomic, copy) NSString *messageId;
@property (nonatomic, copy) NSString *senderId;
@property (nonatomic, copy) NSString *textContent;
@property (nonatomic, copy) NSString *imageContent;
@property (nonatomic, copy) NSString *voiceContent;
@property (nonatomic, assign) MessageType type;


@end
