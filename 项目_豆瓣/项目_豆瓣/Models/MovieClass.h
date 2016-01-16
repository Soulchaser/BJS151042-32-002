//
//  MovieClass.h
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieClass : NSObject
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


@property(strong,nonatomic)NSString *plot_simple;
@property(strong,nonatomic)NSString *title;
@property(strong,nonatomic)NSString *actors;
@property(strong,nonatomic)NSString *poster;
@property(strong,nonatomic)NSString *rating;
@property(strong,nonatomic)NSString *release_date;
@property(strong,nonatomic)NSString *runtime;
@property(strong,nonatomic)NSString *genres;
@property(strong,nonatomic)NSString *country;
@property(strong,nonatomic)NSString *rating_count;
@property(strong,nonatomic)NSString *movieid;









@end
