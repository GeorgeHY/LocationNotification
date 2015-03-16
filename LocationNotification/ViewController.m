//
//  ViewController.m
//  LocationNotification
//
//  Created by iwind on 15/3/16.
//  Copyright (c) 2015年 MUGH. All rights reserved.
//

#import "ViewController.h"
#import "MMPlaceHolder.h"
#import "Masonry.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface ViewController ()
@property (strong, nonatomic)  UIDatePicker *datePicker;

@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.datePicker = [UIDatePicker new];
    [self.datePicker showPlaceHolderWithLineColor:[UIColor redColor]];
    [self.view addSubview:self.datePicker];
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view.mas_centerX);
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(50, 10, 300, 10));
    }];
    
    
//    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:20];
//
//    UILocalNotification *notification = [[UILocalNotification alloc]init];
//    if (notification) {
//        notification.fireDate = date;
//        notification.repeatInterval = kCFCalendarUnitMinute;
//        notification.timeZone = [NSTimeZone defaultTimeZone];
//        notification.soundName = UILocalNotificationDefaultSoundName;
//        
//        notification.alertBody = @"就是一个通知";
//        notification.applicationIconBadgeNumber = 1;
//        
//        NSDictionary * infoDic = [NSDictionary dictionaryWithObject:@"name" forKey:@"key"];
//        notification.userInfo = infoDic;
//        
//        [[UIApplication sharedApplication]scheduleLocalNotification:notification];
//    }

   
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
