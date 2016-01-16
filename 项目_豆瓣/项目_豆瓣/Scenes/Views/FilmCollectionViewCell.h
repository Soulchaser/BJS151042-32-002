//
//  FilmCollectionViewCell.h
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/17.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieClass;
@interface FilmCollectionViewCell : UICollectionViewCell


@property(strong,nonatomic)UIImageView *imgView;
@property(strong,nonatomic)UILabel *nameLabel;
@property(strong,nonatomic)MovieListClass *movieList;

@end
