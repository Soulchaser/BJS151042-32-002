//
//  FilmDetailsView.h
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieClass;
@interface FilmDetailsView : UIView
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


@property(strong,nonatomic)MovieClass *movieClass;
@property(assign,nonatomic)CGFloat plot_simpleLabelHeight;
@property(assign,nonatomic)CGFloat actorsLabelHeight;
@property(strong,nonatomic)UILabel *ratingLabel;
@property(strong,nonatomic)UILabel *rating_countLabel;
@property(strong,nonatomic)UILabel *release_dateLabel;
@property(strong,nonatomic)UILabel *runtimeLabel;
@property(strong,nonatomic)UILabel *genresLabel;
@property(strong,nonatomic)UILabel *countrylabel;
@property(strong,nonatomic)UILabel *actorsLabel;
@property(strong,nonatomic)UILabel *plot_simpleLabel;
@property(strong,nonatomic)UIImageView *imgView;
@property(strong,nonatomic)UIScrollView *plot_simpleSV;
@property(strong,nonatomic)UIScrollView *actorsSV;




@end
