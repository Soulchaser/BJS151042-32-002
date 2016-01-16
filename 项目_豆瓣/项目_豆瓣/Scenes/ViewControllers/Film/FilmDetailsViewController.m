//
//  FilmDetailsViewController.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "FilmDetailsViewController.h"

#define POST_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php"




@interface FilmDetailsViewController ()

@end

@implementation FilmDetailsViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self =[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share"] style:(UIBarButtonItemStyleDone) target:self action:@selector(shareActioon)];
   
    }
    return self;
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)shareActioon
{
    
}
-(void)loadData
{
    
}




#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kGrapone (kScreenHeight/22)
#define kGraptwo (kScreenHeight/30)
#define kImgViewHeight (kGrapone*6)
#define kLabelHeight (kScreenHeight/45)
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    
    /*  NSString *postBody = [NSString stringWithFormat:@"movieId=%@",self.movieID];
  
    NSURL *url = [NSURL URLWithString:POST_URL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSData *bodyData = [postBody dataUsingEncoding:NSUTF8StringEncoding ];
    
    [request setHTTPBody:bodyData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *sessionTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        self.datamovie = [MovieClass new];
        [self.datamovie setValuesForKeysWithDictionary:[dict valueForKey:@"result"]];*/
        
    
 /*       //计算可变label高度和显示UI
        self.navigationItem.title = self.datamovie.title;
        FilmDetailsView *filmDV = [FilmDetailsView new];
        CGRect rect = [self.datamovie.actors boundingRectWithSize:CGSizeMake(kScreenWidth-kGrapone*2, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLabelHeight]} context:nil];
        //NSLog(@"actors%f",rect.size.height);
        filmDV.actorsLabelHeight = rect.size.height;
        
        CGRect rect1 = [self.datamovie.plot_simple boundingRectWithSize:CGSizeMake(kScreenWidth-kGrapone*2, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLabelHeight]} context:nil];
        //NSLog(@"plot_simple%f",rect1.size.height);
        filmDV.plot_simpleLabelHeight = rect1.size.height;
        filmDV.actorsLabelHeight =rect.size.height;
        filmDV.movieClass = self.datamovie;
        
        self.view = filmDV;
        
        
        
        
        
    }];
    [sessionTask resume];*/

    
//    //数据解析
 /*   NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"m%@",self.movieID] ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    self.datamovie = [MovieClass new];
    [self.datamovie setValuesForKeysWithDictionary:[dict valueForKey:@"result"]];
    
    */
    
    //计算可变label高度和显示UI
    self.navigationItem.title = self.datamovie.title;
    FilmDetailsView *filmDV = [FilmDetailsView new];
    //NSLog(@"3%@",self.datamovie.actors);
    CGRect rect = [self.datamovie.actors boundingRectWithSize:CGSizeMake(kScreenWidth-kGrapone*5, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLabelHeight]} context:nil];
    //NSLog(@"actors%f",rect.size.height);
    filmDV.actorsLabelHeight = rect.size.height;
    
    CGRect rect1 = [self.datamovie.plot_simple boundingRectWithSize:CGSizeMake(kScreenWidth-kGrapone*2, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLabelHeight]} context:nil];
    //NSLog(@"plot_simple%f",rect1.size.height);
    filmDV.plot_simpleLabelHeight = rect1.size.height;
    
    filmDV.actorsLabelHeight =rect.size.height;
    filmDV.movieClass = self.datamovie;
   // NSLog(@"2");
    self.view = filmDV;
//
    
    // Do any additional setup after loading the view.
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
