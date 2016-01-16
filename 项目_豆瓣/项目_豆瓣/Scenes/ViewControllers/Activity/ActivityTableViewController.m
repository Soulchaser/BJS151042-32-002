//
//  ActivityTableViewController.m
//  豆瓣
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "ActivityTableViewController.h"
#define GET_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"
@interface ActivityTableViewController ()

@property(strong,nonatomic)NSMutableArray *dataArray;



@end

static NSString *const cellRegistId = @"ActivityCellReuseIdentifier";
@implementation ActivityTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style])
    {
        
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"活动" image:[UIImage imageNamed:@"activity"] selectedImage:[UIImage imageNamed:@"activity"]];
        self.navigationItem.title = @"活动";
        
        
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self loadData];
  //      [self.tableView reloadData];
       /*
        //数据解析
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"activitylist" ofType:@"txt"];
    
        NSData *data = [NSData dataWithContentsOfFile:path];
       // NSLog(@"%@",data);
        
        //使用JSON解析获取字典
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
       // NSLog(@"%@",dict);
        NSUInteger dataCount = [[dict valueForKey:@"count"]integerValue];
        //获取字典中的数据
        
        
        
        NSMutableArray *array  = [[NSMutableArray alloc]initWithCapacity:dataCount];
        array  = [dict valueForKey:@"events"];
       // NSLog(@"%@",array);
        
        
        self.dataArray = [[NSMutableArray alloc]initWithCapacity:dataCount];
        
        for (NSDictionary *dataDic in array)
        {
         //   NSLog(@"%@",dataDic);
            ActivityClass *activity = [ActivityClass new];

            [activity setValuesForKeysWithDictionary:dataDic];
            activity.name = [[dataDic valueForKey:@"owner"]valueForKey:@"name"];
           // NSLog(@"%@",activity);
            [self.dataArray addObject:activity];
        }
       // NSLog(@"%lu",(unsigned long)self.dataArray.count);
        
*/
    }
    return self;
}


-(void)loadData
{
    
    NSURL *url = [[NSURL alloc]initWithString:GET_URL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *sessionTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //使用JSON解析获取字典
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //NSLog(@"%@",dict);
        NSUInteger dataCount = [[dict valueForKey:@"count"]integerValue];
        //获取字典中的数据
        
        
        
        NSMutableArray *array  = [[NSMutableArray alloc]initWithCapacity:dataCount];
        array  = [dict valueForKey:@"events"];
        // NSLog(@"%@",array);
        
        
        self.dataArray = [[NSMutableArray alloc]initWithCapacity:dataCount];
        
        for (NSDictionary *dataDic in array)
        {
            
            //   NSLog(@"%@",dataDic);
            ActivityClass *activity = [ActivityClass new];
            
            [activity setValuesForKeysWithDictionary:dataDic];
            activity.name = [[dataDic valueForKey:@"owner"]valueForKey:@"name"];
            // NSLog(@"%@",activity);
            [self.dataArray addObject:activity];
            //dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
          //  });
            
        }
        
     //   NSLog(@"1");
        //  NSLog(@"%lu",(unsigned long)self.dataArray.count);
    }];
    
    [sessionTask resume];
     
  /*
    NSURL *url = [[NSURL alloc]initWithString:GET_URL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",dict);
    NSUInteger dataCount = [[dict valueForKey:@"count"]integerValue];
    //获取字典中的数据
    
    
    
    NSMutableArray *array  = [[NSMutableArray alloc]initWithCapacity:dataCount];
    array  = [dict valueForKey:@"events"];
    // NSLog(@"%@",array);
    
    
    self.dataArray = [[NSMutableArray alloc]initWithCapacity:dataCount];
    
    for (NSDictionary *dataDic in array)
    {
        
        //   NSLog(@"%@",dataDic);
        ActivityClass *activity = [ActivityClass new];
        
        [activity setValuesForKeysWithDictionary:dataDic];
        activity.name = [[dataDic valueForKey:@"owner"]valueForKey:@"name"];
        // NSLog(@"%@",activity);
        [self.dataArray addObject:activity];
        //dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        //  });
        
    }

    */
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UINib *CellNIB = [UINib nibWithNibName:@"ActivityTableViewCell" bundle:nil];
    
    [self.tableView registerNib:CellNIB forCellReuseIdentifier:cellRegistId];

    
    
    //[self.tableView registerClass:[ActivityCell class] forCellReuseIdentifier:@"ActivityCellReuseIdentifier"];
    
    
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
  //  [self.tableView reloadData];
    if (self.dataArray.count == 0)
    {
        return 10;
    }
    else
        return self.dataArray.count;
   // return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     //
     ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellRegistId forIndexPath:indexPath];
  
    ActivityClass *activity = self.dataArray[indexPath.row];
   // NSLog(@"%@",activity);
    
    cell.activity = activity;
    
    
    
    // Configure the cell...
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityDetailsViewController *details = [[ActivityDetailsViewController alloc]init];
    ActivityClass *data = self.dataArray[indexPath.row];
    
    // details.activityContent = [ActivityClass new];
    
    details.activityContent = data;


    
    
    [self.navigationController pushViewController:details animated:YES];
    

    
    
    
    
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
