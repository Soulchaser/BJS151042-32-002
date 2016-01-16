//
//  AppDelegate.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/8.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //活动界面
    ActivityTableViewController *actVC = [[ActivityTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    UINavigationController *actNC = [[UINavigationController alloc]initWithRootViewController:actVC];
    [actNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    //电影界面
    FilmTableViewController *filmVC = [[FilmTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    //FilmCollectionConTroller *collVC = [[FilmCollectionConTroller alloc]init];
    UINavigationController *filmNC = [[UINavigationController alloc]initWithRootViewController:filmVC];
    [filmNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    //影院界面
    CinemaTableViewController *cinemaVC = [[CinemaTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    UINavigationController *cinemaNC = [[UINavigationController alloc]initWithRootViewController:cinemaVC];
    [cinemaNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    //我的界面
    MineTableViewController *mineVC = [[MineTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *mineNC = [[UINavigationController alloc]initWithRootViewController:mineVC];
    [mineNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    
    UITabBarController *rootTC = [[UITabBarController alloc]init];
    rootTC.viewControllers = @[actNC,filmNC,cinemaNC,mineNC];
    //默认第一个界面
    rootTC.selectedIndex = 0;
    //
    rootTC.delegate =self;
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:rootTC];

    return YES;
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
