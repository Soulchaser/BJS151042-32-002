//
//  MovieClass.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "MovieClass.h"

@implementation MovieClass



-(NSString *)description
{
    return [NSString stringWithFormat:@"%@",_actors];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
   // NSLog(@"===%@",key);
}


@end
