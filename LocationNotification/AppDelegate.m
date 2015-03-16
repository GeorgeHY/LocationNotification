//
//  AppDelegate.m
//  LocationNotification
//
//  Created by iwind on 15/3/16.
//  Copyright (c) 2015年 MUGH. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >=  8.0) {

        if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
            
        {
            
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
        }
    
    }
    

    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    UILocalNotification *notification = [[UILocalNotification alloc]init];
    [notification setAlertBody:@"Watch the Latest Episode of CCA-TV"];
    NSDate * date = [NSDate dateWithTimeIntervalSinceNow:0];
    [notification setFireDate:date];
    [notification setRepeatInterval:NSCalendarUnitMinute];
    [notification setTimeZone:[NSTimeZone defaultTimeZone]];
    [notification setSoundName:UILocalNotificationDefaultSoundName];
    NSDictionary * infoDic = [NSDictionary dictionaryWithObject:@"1" forKey:@"ActivityClock"];
    notification.userInfo = infoDic;
    
    NSInteger x = [UIApplication sharedApplication].applicationIconBadgeNumber;
    self.count++;
    notification.applicationIconBadgeNumber = self.count;
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"通知" message:notification.alertBody delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];

    
    
//    UIApplication * app = [UIApplication sharedApplication];
//    NSArray * localArray = [app scheduledLocalNotifications];
//    UILocalNotification * localNotification;
//    if (localArray) {
//        for (UILocalNotification * noti in localArray) {
//            NSDictionary * dict = noti.userInfo;
//            if (dict) {
//                NSString * inkey = [dict objectForKey:@"ActivityClock"];
//                if ([inkey isEqualToString:@"1"]) {
//                    if (localNotification) {
//                        localNotification = nil;
//                    }
//
//                    break;
//                }
//            }
//        }
//    }
//    
//    if (!localNotification) {
//        localNotification  = [[UILocalNotification alloc]init];
//    }
//    if (localNotification) {
//        [app cancelLocalNotification:localNotification];
//        return;
//    }
}

-(void)applicationDidBecomeActive:(UIApplication *)application{
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

@end
