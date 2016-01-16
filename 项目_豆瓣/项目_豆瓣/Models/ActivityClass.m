//
//  ActivityClass.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "ActivityClass.h"

@implementation ActivityClass






-(NSString *)description
{
    return [NSString stringWithFormat:@"%@==%@==%@==%ld==%ld==%@==%@==%@==%@",_title,_address,_category_name,(long)_participant_count,(long)_wisher_count,_begin_time,_end_time,_name,_content];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
  //  NSLog(@"%@=====%@",value,key);
}


@end
