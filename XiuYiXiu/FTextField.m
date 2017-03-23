//
//  FTextField.m
//  LuoTaiFu
//
//  Created by 付强 on 2017/2/20.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "FTextField.h"

@implementation FTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame Icon:(UIImageView*)icon
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftView = icon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}
-(CGRect) textRectForBounds:(CGRect)bounds{
    CGRect Rect = [super textRectForBounds:bounds];
    Rect.origin.x += 0;// 右偏10
    return Rect;
}
-(CGRect) leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10
    return iconRect;
}
@end
