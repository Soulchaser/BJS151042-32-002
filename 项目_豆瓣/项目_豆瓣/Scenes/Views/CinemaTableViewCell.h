//
//  CinemaTableViewCell.h
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/8.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaTableViewCell : UITableViewCell


@property(strong,nonatomic)UILabel *nameLabel;
@property(strong,nonatomic)UILabel *addressLabel;
@property(strong,nonatomic)UILabel *phoneNumLabel;

+(CGFloat)calculateHeight;


@end

