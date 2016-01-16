//
//  ActivityTableViewCell.h
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/8.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityClass;
@interface ActivityTableViewCell : UITableViewCell


+(CGFloat)calculateHeight:(ActivityClass *)activity;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *category_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wisher_countLabel;
@property (weak, nonatomic) IBOutlet UILabel *participant_countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property(strong,nonatomic)ActivityClass *activity;

@end
