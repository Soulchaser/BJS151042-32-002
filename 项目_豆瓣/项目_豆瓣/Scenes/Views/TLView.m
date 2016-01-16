//
//  TLView.m
//  豆瓣
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "TLView.h"

@implementation TLView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame])
    {
       
        [self drawView];
    }
    return self;
}

-(void)drawView
{
   // self.backgroundColor = [UIColor greenColor];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/18, 5, kScreenWidth/4, kScreenHeight/15)];
   // self.label.backgroundColor =[UIColor orangeColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.label.frame)+kScreenWidth/18, 5, kScreenWidth/2, kScreenHeight/15)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
  //  self.textField.layer.cornerRadius = 10;
   // self.textField.layer.masksToBounds = YES;
    self.textField.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.label];
    [self addSubview:self.textField];
}

@end
