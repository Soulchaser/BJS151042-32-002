//
//  FilmTableViewController.m
//  豆瓣
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "FilmTableViewController.h"
#define GET_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php"
#define DetailePOST_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php"
@interface FilmTableViewController ()


@property(strong,nonatomic)NSMutableArray *dataArray;
@property(strong,nonatomic)NSMutableArray *movieDataArray;

@end


static NSString * const FilmcellResueID = @"FilmCellReuseIdentifier";

@implementation FilmTableViewController


-(instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style])
    {
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"电影" image:[UIImage imageNamed:@"movie"] selectedImage:[UIImage imageNamed:@"movie"]];
        self.navigationItem.title = @"电影";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_collection"] style:UIBarButtonItemStyleDone target:self action:@selector(listAction:)];
       /* NSString *path = [[NSBundle mainBundle]pathForResource:@"movielist" ofType:@"txt"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *arr = [dict valueForKey:@"result"];
        self.dataArray = [[NSMutableArray alloc]initWithCapacity:20];
        for (NSDictionary *dataDic in arr)
        {
            
            MovieListClass *movieList = [[MovieListClass alloc]init];
            [movieList setValuesForKeysWithDictionary:dataDic];
           
            [self.dataArray addObject:movieList];
            
        }*/
        
        [self loadData];
    
    }
    return self;
}
-(void)listAction:(UIBarButtonItem *)barButton
{

 //       self.navigationItem.rightBarButtonItem.image =[UIImage imageNamed:@"btn_nav_list"];
        
        FilmCollectionConTroller *filmCollectionCon = [[FilmCollectionConTroller alloc]init];
    
    filmCollectionCon.dataArray = [[NSMutableArray alloc]initWithCapacity:20];
    filmCollectionCon.dataArray = self.dataArray;
    NSLog(@"+%@",self.dataArray[0]);
    [self.navigationController pushViewController:filmCollectionCon animated:NO];
        
  
}


-(void)loadData
{
    
    NSURL *url = [NSURL URLWithString:GET_URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *sessionTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *arr = [dict valueForKey:@"result"];
        self.dataArray = [[NSMutableArray alloc]initWithCapacity:20];
        self.movieDataArray = [[NSMutableArray alloc]initWithCapacity:20];
        for (NSDictionary *dataDic in arr)
        {
            [self.tableView reloadData];
            MovieListClass *movieList = [[MovieListClass alloc]init];
            [movieList setValuesForKeysWithDictionary:dataDic];
            
            [self.dataArray addObject:movieList];
            /*
            NSURL *movieurl = [NSURL URLWithString:[NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php?movieId=%@",movieList.movieId]];
            
            NSURLSession *session = [NSURLSession sharedSession];
            
            NSURLSessionTask *sessionTask = [session dataTaskWithURL:movieurl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                             {
                                                 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                                 MovieClass *datamovie = [MovieClass new];
                                                 [datamovie setValuesForKeysWithDictionary:[dict valueForKey:@"result"]];
                                                 [self.movieDataArray addObject:datamovie];
                                                 
                                                 
                                             }];
            
            [sessionTask resume];
            
            */
 
        }
        
    }];
    
    
    
    [sessionTask resume];
    
 
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[FilmTableViewCell class] forCellReuseIdentifier:FilmcellResueID];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
//    if (self.dataArray.count == 0)
//    {
//        return 10;
//    }
//    else
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FilmcellResueID forIndexPath:indexPath];
    cell.movieList = self.dataArray[indexPath.row];
    // Configure the cell...
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  /*  MovieListClass *data = self.dataArray[indexPath.row];

    FilmDetailsViewController *detailsVC = [FilmDetailsViewController new];

    detailsVC.movieID = data.movieId;

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php?movieId=%@",detailsVC.movieID]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) temp = self;
    NSURLSessionTask *sessionTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        detailsVC.datamovie = [MovieClass new];
        [detailsVC.datamovie setValuesForKeysWithDictionary:[dict valueForKey:@"result"]];
        NSLog(@"1%@",detailsVC.datamovie);
        [temp.navigationController pushViewController:detailsVC animated:YES];
    }];
    
    [sessionTask resume];*/
    
    
    
  /*  NSString *postBody = [NSString stringWithFormat:@"movieId=%@",detailsVC.movieID];
    NSLog(@"%@",postBody);
    
    NSURL *url = [NSURL URLWithString:DetailePOST_URL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSData *bodyData = [postBody dataUsingEncoding:NSUTF8StringEncoding ];
    
    [request setHTTPBody:bodyData];
    
    NSURLSession *session = [NSURLSession sharedSession];
   
    NSURLSessionTask *sessionTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        detailsVC.datamovie = [MovieClass new];
        [detailsVC.datamovie setValuesForKeysWithDictionary:[dict valueForKey:@"result"]];
        NSLog(@"1%@",detailsVC.datamovie);
        
    }];
    [sessionTask resume];
     NSLog(@"2%@",detailsVC.datamovie);*/
    
    
    MovieListClass *data = self.dataArray[indexPath.row];
    FilmDetailsViewController *detailsVC = [FilmDetailsViewController new];
    /*
    for (MovieClass *movie in self.movieDataArray)
    {
        if ([movie.movieid isEqualToString:data.movieId])
        {
             detailsVC.datamovie = movie;
            break;
        }
    }
    
   */
    
    NSURL *movieurl = [NSURL URLWithString:[NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php?movieId=%@",data.movieId]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *sessionTask = [session dataTaskWithURL:movieurl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                     {
                                         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                         MovieClass *datamovie = [MovieClass new];
                                         [datamovie setValuesForKeysWithDictionary:[dict valueForKey:@"result"]];
                                         detailsVC.datamovie = datamovie;
                                         
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             
                                              [self.navigationController pushViewController:detailsVC animated:YES];
                                         });
                                         
                                         
                                         
                                     }];
    
    [sessionTask resume];
   
    
    
   
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
