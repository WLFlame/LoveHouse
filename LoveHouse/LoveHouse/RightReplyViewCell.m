//
//  RightReplyViewCell.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/26.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "RightReplyViewCell.h"
#import "Message.h"
@interface RightReplyViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lbReply;

@end

@implementation RightReplyViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMessage:(Message *)message
{
    _message = message;
    self.lbReply.text = message.textContent;
}

@end
