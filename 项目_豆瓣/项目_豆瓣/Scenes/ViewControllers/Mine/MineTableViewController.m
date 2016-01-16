//
//  MineTableViewController.m
//  豆瓣
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "MineTableViewController.h"

@interface MineTableViewController ()


@property(strong,nonatomic)NSMutableArray *dataArr;

@end
static NSString *const cellReuseID = @"cellRegistifier";
@implementation MineTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style])
    {
        self.navigationItem.title = @"我的";
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"user"] selectedImage:[UIImage imageNamed:@"user"]];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(loginAction:)];
        
        self.dataArr  = [[NSMutableArray alloc]initWithCapacity:10];
        
        [self.dataArr addObject:@"我的活动"];
        [self.dataArr addObject:@"我的电影"];
        [self.dataArr addObject:@"清除缓存"];
        
    }
    return self;
    
}

-(void)loginAction:(UIBarButtonItem *)barButton
{
    LoginViewController *loginVC = [LoginViewController new];
    
    loginVC.title = @"用户登录";
    //[self presentViewController:loginNC animated:YES completion:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseID];
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
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID forIndexPath:indexPath];
    
    if (indexPath.row <3)
    {
        cell.textLabel.text = self.dataArr[indexPath.row];
    }
    
    
    // Configure the cell...
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        ShowTableViewController *showTVC = [ShowTableViewController new];
        showTVC.title = @"活动收藏";
        [self.navigationController pushViewController:showTVC animated:YES];
    }
    else if (indexPath.row == 1)
    {
        ShowTableViewController *showTVC = [ShowTableViewController new];
        showTVC.title = @"电影收藏";
        [self.navigationController pushViewController:showTVC animated:YES];
    }
    else if (indexPath.row == 2)
    {
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确认注销" preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *defulAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertCon addAction:defulAction];
        [alertCon addAction:cancelAction];
        
        [self showDetailViewController:alertCon sender:nil];
    }
    
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
