//
//  AppDelegate.m
//  IsItTheWeekend
//
//  Created by Matthew Chupp on 3/18/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "AppDelegate.h"
#import "MCWeekendViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    MCWeekendViewController *weekendVC = [[MCWeekendViewController alloc] init];
    self.window.rootViewController = weekendVC;
    
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end
