//
//  CinemaTableViewCell.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/8.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "CinemaTableViewCell.h"
#define kCellWidth ([UIScreen mainScreen].bounds.size.width-16)
#define kCellHeight (([UIScreen mainScreen].bounds.size.height-160)/4)
@implementation CinemaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
        
    }
    return self;
}

-(void)drawView
{
    UIImageView *backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 8, kCellWidth, kCellHeight)];
    backImgView.image = [UIImage imageNamed:@"bg_eventlistcell"];
    
    [self addSubview:backImgView];
    
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, kCellWidth-16, (kCellHeight-16)/3)];
    [self.nameLabel setTextAlignment:NSTextAlignmentLeft];
    self.nameLabel.font = [UIFont systemFontOfSize:(kCellHeight-16)/3];
    self.nameLabel.text = @"123";
    [backImgView addSubview:self.nameLabel];
    
    
    self.addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame), kCellWidth-16, (kCellHeight-16)/3)];
    self.addressLabel.numberOfLines = 0;
    self.addressLabel.text = @"sadfiaslidjfisjdfhsdofhosidhfoshdgohsadoghsaodhgoshdgoshdgoshdgoashdfohsdfosdfsdfasdfsadfsadgsdgsafsdfsdfsfd";
    [backImgView addSubview:self.addressLabel];
    
    
    
    self.phoneNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.addressLabel.frame), CGRectGetMaxY(self.addressLabel.frame),  kCellWidth-16, (kCellHeight-16)/3)];
    [backImgView addSubview:self.phoneNumLabel];
    
    
    
    
    
    
    
    
    
}

+(CGFloat)calculateHeight
{
    return kCellHeight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
