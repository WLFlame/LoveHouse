//
//  LeftReplyViewCell.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/26.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "LeftReplyViewCell.h"
#import "Message.h"
@interface LeftReplyViewCell()

@property (weak, nonatomic) IBOutlet UILabel *lbReply;

@end

@implementation LeftReplyViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMessage:(Message *)message
{
    _message = message;
//    self.lbReply.text = message.textContent;
}

@end
