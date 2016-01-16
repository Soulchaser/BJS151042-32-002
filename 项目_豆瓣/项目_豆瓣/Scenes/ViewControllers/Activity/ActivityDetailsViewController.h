//
//  ActivityDetailsViewController.h
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityClass;
@interface ActivityDetailsViewController : UIViewController

@property(strong,nonatomic)NSString *str;
@property(strong,nonatomic)ActivityClass *activityContent;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *category_nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;








@end
