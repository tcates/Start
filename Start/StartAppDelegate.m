//
//  StartAppDelegate.m
//  Start
//
//  Created by Tara Cates on 7/2/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "StartAppDelegate.h"
#import "User.h"
#import "Goal.h"
#import "GoalEntry.h"
#import "GoalBuddies.h"
#import "GoalMonthTableViewController.h"
#import "GoalCreationViewController.h"
#import "MainTabBarViewController.h"
#import <Parse/Parse.h>

@implementation StartAppDelegate {
    GoalMonthTableViewController *_goalMonthTableViewController;
    GoalCreationViewController *_goalCreationViewController;
    MainTabBarViewController *_mainTabBarViewController;
}

- (void)_parseInit
{
    [Goal registerSubclass];
    [GoalEntry registerSubclass];
    [User registerSubclass];
    [GoalBuddies registerSubclass];
    
    [Parse setApplicationId:@"R9PwbTiaZksYBGzL8vBcDyXrEpNrGtaFITzZKM5D"
                  clientKey:@"daWysRh8ThSt3pkGfBDsVJ1O7soK1CaFC2JwxTvM"];
    [PFFacebookUtils initializeFacebook];
}

- (void)_displayLoginViewController
{
    PFLogInViewController *loginController = [PFLogInViewController new];
    loginController.fields = PFLogInFieldsFacebook | PFLogInFieldsTwitter | PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton | PFLogInFieldsPasswordForgotten;
    
    UILabel *logo = [UILabel new];
    logo.text = @"Start";
    logo.textColor = [UIColor whiteColor];
    logo.font = [UIFont systemFontOfSize:25];
    //    NSLog(@"%@", logo.font);
    [logo sizeToFit];
    loginController.logInView.logo = logo;
    
    [self.window.rootViewController presentViewController:loginController animated:YES completion:NULL];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self _parseInit];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    UINavigationController *controller = [UINavigationController new];
    controller.navigationBar.translucent = NO;
    
    _mainTabBarViewController = [MainTabBarViewController new];
    _goalCreationViewController = [GoalCreationViewController new];
    _goalMonthTableViewController = [GoalMonthTableViewController new];
    NSArray *goalControllers = [NSArray arrayWithObjects:_goalCreationViewController, _goalMonthTableViewController, nil];
    _mainTabBarViewController.viewControllers = goalControllers;
    
    //[controller pushViewController:_goalMonthTableViewController animated:NO];
    self.window.rootViewController = controller;
    [controller pushViewController:_mainTabBarViewController animated:NO];
        
    User *user = [User currentUser];
    if (user == nil) {
        [self _displayLoginViewController];
    } else {
        _goalMonthTableViewController.user = user;
    }
        
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
