//
//  AppDelegate.m
//  LoveHouse
//
//  Created by wanli.yang on 16/4/23.
//  Copyright © 2016年 wanli.yang. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ECSlidingViewController.h"
#import "MenuTableViewController.h"
#import "HouseViewController.h"
#import "LinkNavHelper.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [AVOSCloud setApplicationId:@"NicESrLxi2FHWq17yT2l0Qo7-gzGzoHsz"
                      clientKey:@"jl7ezSvszYBGV7fzXAxTR2Xp"];
    [NBSAppAgent startWithAppID:@"195b3583147d408f8927fb64761547be"];
    [self globalAppearnceSet];
    AVUser *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        // 跳转到首页
        MenuTableViewController *leftMenu = [[MenuTableViewController alloc] init];
        HouseViewController *houseVc = [[HouseViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:houseVc];
        ECSlidingViewController *slidingVc = [ECSlidingViewController slidingWithTopViewController:navigationController];
        [LinkNavHelper sharedHelper].slidingVC = slidingVc;
        slidingVc.underLeftViewController = leftMenu;
        [navigationController.view addGestureRecognizer:slidingVc.panGesture];
        slidingVc.anchorRightPeekAmount = [UIScreen mainScreen].bounds.size.width * 0.55;
        self.window.rootViewController = slidingVc;
    } else {
        //缓存用户对象为空时，可打开用户注册界面…
        self.window.rootViewController = [[LoginViewController alloc] init];
    }
    
   
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)globalAppearnceSet
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.window.tintColor = [UIColor colorWithHexString:@"FF3286"];
    UIBarButtonItem *barItemAppearence = [UIBarButtonItem appearance];
    [barItemAppearence setTitleTextAttributes:@{
                                               NSForegroundColorAttributeName : [UIColor whiteColor],
                                               NSFontAttributeName : [UIFont systemFontOfSize:15]
                                               } forState:UIControlStateNormal];
    
    NSShadow *shadown = [[NSShadow alloc] init];
    shadown.shadowColor = [UIColor lightGrayColor];
    shadown.shadowOffset = CGSizeZero;
    
    UINavigationBar *navigationBarAppearence = [UINavigationBar appearance];
    [navigationBarAppearence setTitleTextAttributes:@{
                                                      NSShadowAttributeName : shadown,
                                                      NSForegroundColorAttributeName : [UIColor whiteColor]
                                                      }];
    navigationBarAppearence.barTintColor = [UIColor colorWithHexString:@"f76483"];
    
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
