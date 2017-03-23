//
//  FBXuQiu_4TableViewCell.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/16.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "FBXuQiu_4TableViewCell.h"

@implementation FBXuQiu_4TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"输入具体的求助信息，清楚准确的信息更容易被帮助";
    placeHolderLabel.font = [UIFont systemFontOfSize:15];
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor colorWithRed:199.0/255.0 green:199.0/255.0 blue:205.0/255.0 alpha:1];
    [placeHolderLabel sizeToFit];
    [self.waite addSubview:placeHolderLabel];
    
    [self.waite setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
