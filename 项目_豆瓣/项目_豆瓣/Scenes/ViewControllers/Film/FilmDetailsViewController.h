//
//  FilmDetailsViewController.h
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieClass;
@interface FilmDetailsViewController : UIViewController



@property(strong,nonatomic)NSString *movieID;
@property(strong,nonatomic)MovieClass *datamovie;


@end
