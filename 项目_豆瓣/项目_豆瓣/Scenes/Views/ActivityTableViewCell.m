//
//  ActivityTableViewCell.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/8.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import <UIImageView+WebCache.h>
#define kActivityCellWidth 190
#define kActivityCellHeight 414
@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}



-(void)setActivity:(ActivityClass *)activity
{
    if (_activity != activity)
    {
        _activity = nil;
        _activity = activity;
    }
    self.titleLabel.text = activity.title;
    self.addressLabel.text = activity.address;
    self.category_nameLabel.text = activity.category_name;
    self.wisher_countLabel.text = [NSString stringWithFormat:@"%li",(long)activity.wisher_count];
   // NSLog(@"%ld",(long)activity.wisher_count);
    self.participant_countLabel.text = [NSString stringWithFormat:@"%li",activity.participant_count];
    NSRange range = {5,11};
    NSString *str1 = [activity.begin_time substringWithRange:range];
   
    NSString *str2 = [activity.end_time substringWithRange:range];
    
    self.timeLabel.text = [NSString stringWithFormat:@"%@ -- %@",str1,str2];
    
   // NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:activity.image]];
    //NSLog(@"%@",activity.image);
   // UIImage *img = [UIImage imageWithData:data];
   // self.imgView.image = img;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:activity.image] placeholderImage:[UIImage imageNamed:@"picholder"]];
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
