//
//  AppDelegate.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/14.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "AppDelegate.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "ViewController.h"
#import "HelpMeViewController.h"
#import "HelpTaViewController.h"
#import "FondViewController.h"
#import "MyViewController.h"
BMKMapManager* _mapManager;
@implementation AppDelegate
    
    @synthesize window;
    
    


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"WGcL7yxfGAzuGR7lIGKLUv6ADUVfUbfP" generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    UITabBarController *tab = [[UITabBarController alloc] init];
    
    UINavigationController *index = [[UINavigationController alloc] initWithRootViewController:[ViewController alloc]];
    index.view.backgroundColor = [UIColor whiteColor];
    index.tabBarItem.title = @"首页";
    index.navigationBar.translucent = NO;

    index.tabBarItem.image = [UIImage imageNamed:@"首页"];
    
    UINavigationController *fenlei = [[UINavigationController alloc] initWithRootViewController:[HelpMeViewController alloc]];
    fenlei.view.backgroundColor = [UIColor whiteColor];
    fenlei.tabBarItem.title = @"帮帮我";
    fenlei.navigationBar.translucent = NO;
    fenlei.tabBarItem.image = [UIImage imageNamed:@"帮帮我"];
    
    
    UINavigationController *faxian = [[UINavigationController alloc] initWithRootViewController:[HelpTaViewController alloc]];
    faxian.view.backgroundColor = [UIColor whiteColor];
    faxian.tabBarItem.title = @"帮帮ta";
    faxian.tabBarItem.image = [UIImage imageNamed:@"帮帮ta"];
    faxian.navigationBar.translucent = NO;
    
    UINavigationController *gw = [[UINavigationController alloc] initWithRootViewController:[FondViewController alloc]];
    gw.view.backgroundColor = [UIColor whiteColor];
    gw.tabBarItem.title = @"发现";
    gw.tabBarItem.image = [UIImage imageNamed:@"发现"];
    gw.navigationBar.translucent = NO;
    UINavigationController *my = [[UINavigationController alloc] initWithRootViewController:[MyViewController alloc]];
    my.view.backgroundColor = [UIColor whiteColor];
    my.tabBarItem.title = @"我的";
    my.navigationBar.translucent = NO;
    my.tabBarItem.image = [UIImage imageNamed:@"我的"];
    
    
    tab.viewControllers = @[index,fenlei,faxian,gw,my];
    tab.tabBar.tintColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:233.0/255.0 alpha:1];
    

    
        self.window.rootViewController=tab;
    
    
    
    
    
    return YES;
}
- (void)onGetNetworkState:(int)iError
    {
        if (0 == iError) {
            NSLog(@"联网成功");
        }
        else{
            NSLog(@"onGetNetworkState %d",iError);
        }
        
    }
    
- (void)onGetPermissionState:(int)iError
    {
        if (0 == iError) {
            NSLog(@"授权成功");
        }
        else {
            NSLog(@"onGetPermissionState %d",iError);
        }
    }

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"XiuYiXiu"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
