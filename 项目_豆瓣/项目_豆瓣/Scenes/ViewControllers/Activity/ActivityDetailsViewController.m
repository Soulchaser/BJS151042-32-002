//
//  ActivityDetailsViewController.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import <UIImageView+WebCache.h>
@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share"] style:UIBarButtonItemStyleDone target:self action:@selector(shareAction:)];
    
    }
    
    return self;
    
}



-(void)backAction:(UIBarButtonItem *)buttonItem

{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(void)shareAction:(UIBarButtonItem *)buttonItem

{
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.activityContent.title;

    NSRange range = {5,11};
    NSString *startStr = [self.activityContent.begin_time substringWithRange:range];
    NSString *endStr = [self.activityContent.end_time substringWithRange:range];
    
    self.TimeLabel.text = [NSString stringWithFormat:@"%@ -- %@",startStr,endStr];
    self.nameLabel.text = self.activityContent.name;
    self.TitleLabel.text = self.activityContent.title;
    self.addressLabel.text = self.activityContent.address;
    self.category_nameLabel.text = self.activityContent.category_name;
   /*
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.activityContent.image]];
    self.imgView.image =[UIImage imageWithData:imgData];
    */
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.activityContent.image] placeholderImage:[UIImage imageNamed:@"picholder"]];
    self.contentLabel.text = self.activityContent.content;
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
