//
//  FilmTableViewCell.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "FilmTableViewCell.h"
#import <UIImageView+WebCache.h>
#define kCellWidth ([UIScreen mainScreen].bounds.size.width-16)
#define kCellHeight (([UIScreen mainScreen].bounds.size.height-180)/3)
@implementation FilmTableViewCell

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
    
    UIImageView *imgBackView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 8, kCellWidth, kCellHeight)];
    imgBackView.image = [UIImage imageNamed:@"bg_eventlistcell"];
    [self addSubview:imgBackView];
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 8, kCellHeight*3/4, kCellHeight-16)];
    
    self.imgView.image = [UIImage imageNamed:@"picholder"];
    [imgBackView addSubview:self.imgView];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame), CGRectGetMaxY(self.imgView.frame)/2, kCellWidth*3/4, kCellHeight/4)];
    self.nameLabel.text = @"123";
    [self.nameLabel setTextAlignment:NSTextAlignmentLeft];
    [imgBackView addSubview:self.nameLabel];
    
    
    
    
}


-(void)setMovieList:(MovieListClass *)movieList
{
    if (_movieList != movieList)
    {
        _movieList = nil;
        _movieList = movieList;
    }
    self.nameLabel.text = movieList.movieName;
   /*
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:movieList.pic_url]];
    UIImage *image = [UIImage imageWithData:imgData];
    self.imgView.image = image;
    */
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:movieList.pic_url] placeholderImage:[UIImage imageNamed:@"picholder"]];
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
