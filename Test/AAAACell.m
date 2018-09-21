
//
//  AAAACell.m
//  Test
//
//  Created by HTYL on 2018/9/18.
//  Copyright © 2018年 HTYL. All rights reserved.
//

#import "AAAACell.h"

@implementation AAAACell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 100)];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.label];
    }
    return self;
}
@end
