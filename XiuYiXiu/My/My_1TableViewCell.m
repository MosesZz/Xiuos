//
//  My_1TableViewCell.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/20.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "My_1TableViewCell.h"

@implementation My_1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _img.layer.cornerRadius = _img.frame.size.height/2;
    _img.layer.masksToBounds = YES;
    
    _renzheng.frame = CGRectMake(MyWidth/2-5-_renzheng.frame.size.width, _renzheng.frame.origin.y, _renzheng.frame.size.width, _renzheng.frame.size.height);
    
     _fenzhi.frame = CGRectMake(MyWidth/2+5, _fenzhi.frame.origin.y, _fenzhi.frame.size.width, _renzheng.frame.size.height);
         _zhi.frame = CGRectMake(MyWidth/2+5, _fenzhi.frame.origin.y, _fenzhi.frame.size.width, _renzheng.frame.size.height);
    _name.text = @"王先生王先生王先生  ";
    NSDictionary *attrs = @{NSFontAttributeName : _name.font};
    CGSize size=[_name.text sizeWithAttributes:attrs];
    _bianji.frame = CGRectMake(MyWidth/2+size.width/2, _bianji.frame.origin.y, _bianji.frame.size.width, _bianji.frame.size.height);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
