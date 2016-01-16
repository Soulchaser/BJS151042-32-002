//
//  FilmDetailsView.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "FilmDetailsView.h"


@implementation FilmDetailsView


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kGrapone (kScreenHeight/22)
#define kGraptwo (kScreenHeight/30)
#define kImgViewHeight (kGrapone*6)
#define kLabelHeight (kScreenHeight/45)
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self drawView];
    }
    return self;
}

-(void)drawView
{
    //plot_simple：简介
    //title：电影名字
    //actors：制作人信息
    //poster：图片
    //rating：评分
    //release_date：上映时间
    //runtime：时间
    //genres：分类
    //country：国家
    //rating_count: 评论人数
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(kGrapone,kGrapone , kImgViewHeight*9/16, kImgViewHeight)];
    
    [self addSubview:self.imgView];
    
    UILabel *labelone = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame)+kGrapone, kGrapone, kGrapone+kGraptwo/2, kLabelHeight)];
    labelone.text = @"评分:";
    [self addSubview:labelone];
    //评分
    self.ratingLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(labelone.frame), kGrapone, kGrapone+kGraptwo, kLabelHeight)];
    
    [self addSubview:self.ratingLabel];
    //评论
    self.rating_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ratingLabel.frame), kGrapone, kGrapone*3, kLabelHeight)];
    
    [self addSubview:self.rating_countLabel];
    //上映时间
    self.release_dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame)+kGrapone, CGRectGetMaxY(labelone.frame)+kGraptwo, kGrapone*4, kLabelHeight)];
    self.release_dateLabel.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:self.release_dateLabel];
    //时长
    self.runtimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame)+kGrapone, CGRectGetMaxY(self.release_dateLabel.frame)+kGraptwo, kGrapone*4, kLabelHeight)];
    self.runtimeLabel.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:self.runtimeLabel];
    
    //类型
    self.genresLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame)+kGrapone, CGRectGetMaxY(self.runtimeLabel.frame)+kGraptwo, kGrapone*4, kLabelHeight)];
    self.genresLabel.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:self.genresLabel];
    
    //国家
    self.countrylabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame)+kGrapone, CGRectGetMaxY(self.genresLabel.frame)+kGraptwo, kGrapone*4, kLabelHeight)];
    self.countrylabel.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:self.countrylabel];
    //制作人标题
    UILabel *labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(kGrapone, CGRectGetMaxY(self.imgView.frame)+kGrapone, kGrapone+kGraptwo, kLabelHeight)];
    labelTwo.text = @"制作人";
    [self addSubview:labelTwo];
    //制作人可变显示框
    self.actorsSV = [[UIScrollView alloc]initWithFrame:CGRectMake(kGrapone, CGRectGetMaxY(labelTwo.frame)+kGraptwo, kScreenWidth-kGrapone*2, kLabelHeight*3)];
    
    self.actorsLabelHeight = kLabelHeight*3;
    self.actorsSV.contentSize = CGSizeMake(kScreenWidth-kGrapone*2, self.actorsLabelHeight);
    
    self.actorsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.actorsSV.contentSize.width, self.actorsSV.contentSize.height)];
    self.actorsLabel.numberOfLines = 0;
    [self.actorsSV addSubview:self.actorsLabel];
    [self addSubview:self.actorsSV];
    
    //电影情节标题
    UILabel *labelThree = [[UILabel alloc]initWithFrame:CGRectMake(kGrapone, CGRectGetMaxY(self.actorsSV.frame)+kGraptwo, kGrapone*3, kLabelHeight)];
    labelThree.text = @"电影情节";
    [self addSubview:labelThree];
    
    //电影情节可变框
    self.plot_simpleSV = [[UIScrollView alloc]initWithFrame:CGRectMake(kGrapone, CGRectGetMaxY(labelThree.frame)+kGraptwo, kScreenWidth-kGrapone*2, kScreenHeight-CGRectGetMaxY(labelThree.frame)-kGrapone-kGraptwo-100)];
    
//    self.plot_simpleSV.bounces = NO;
    self.plot_simpleLabelHeight = kLabelHeight;
    
    self.plot_simpleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-kGrapone*2, self.plot_simpleLabelHeight)];
    
    self.plot_simpleLabel.font = [UIFont systemFontOfSize:kLabelHeight];
    self.plot_simpleLabel.numberOfLines = 0;
    [self.plot_simpleSV addSubview:self.plot_simpleLabel];
    self.plot_simpleSV.contentSize = CGSizeMake(kScreenWidth-kGrapone*2, self.plot_simpleLabelHeight) ;

    
    [self addSubview:self.plot_simpleSV];
    
}

-(void)setMovieClass:(MovieClass *)movieClass
{
    
    //title：电影名字
    //rating：评分
    //rating_count: 评论人数
    
    
    
    if (_movieClass != movieClass)
    {
        _movieClass = nil;
        _movieClass = movieClass;
    }
    //runtime：时间
    self.runtimeLabel.text = self.movieClass.runtime;
    //genres：分类
    self.genresLabel.text = self.movieClass.genres;
    //release_date：上映时间
    self.release_dateLabel.text = self.movieClass.release_date;
    //country：国家
    self.countrylabel.text = self.movieClass.country;
    //poster：图片
    /*
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.movieClass.poster]];
    UIImage *img = [UIImage imageWithData:imgData];
    self.imgView.image = img;
     */
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.movieClass.poster] placeholderImage:[UIImage imageNamed:@"picholder"]];
    
    
    //actors：制作人信息
    self.actorsLabel.text = self.movieClass.actors;
    self.actorsSV.contentSize = CGSizeMake(kScreenWidth-kGrapone*2, self.actorsLabelHeight);
    self.actorsLabel.frame = CGRectMake(0, 0, self.actorsSV.contentSize.width, self.actorsSV.contentSize.height);
    
    
    //plot_simple：简介
    self.plot_simpleSV.contentSize = CGSizeMake(kScreenWidth-kGrapone*2, self.plot_simpleLabelHeight) ;
    self.plot_simpleLabel.frame= CGRectMake(0, 0, kScreenWidth-kGrapone*2, self.plot_simpleLabelHeight);
    self.plot_simpleLabel.text = self.movieClass.plot_simple;

  
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
