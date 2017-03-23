//
//  AppDelegate.h
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/14.
//  Copyright © 2017年 付强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface AppDelegate : NSObject <UIApplicationDelegate, BMKGeneralDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
}
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

