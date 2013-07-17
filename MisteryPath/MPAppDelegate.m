//
//  MPAppDelegate.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPAppDelegate.h"
#import "MPViewController.h"
#import "MPMainMenuGameState.h"

@implementation MPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _viewController = _window.rootViewController;
    // start looping
    [NSTimer scheduledTimerWithTimeInterval:0.033 target:self selector:@selector(gameLoop:) userInfo:nil repeats:NO];
    
    return YES;
}

- (void)gameLoop:(id)sender {
    // Get current view
    MPGameState *currentView = (MPGameState *)[self getCurrentView];
    // Update and Render the actual view if is a Game State
    if (currentView.superclass == [MPGameState class]) {
        [currentView update];
        [currentView render];
    }
    NSLog(@"%@", [currentView class]);
        
    // and looping
    [NSTimer scheduledTimerWithTimeInterval:0.033 target:self selector:@selector(gameLoop:) userInfo:nil repeats:NO];
}

- (void)doStateChange:(Class)state {
    // Initialize view controller
    _window.rootViewController = [[UIViewController alloc] init];
    // Instantiate new view controller based on sent state
    NSString *asset = [NSString stringWithFormat:@"%@", state ];
    MPViewController *newState = [_viewController.storyboard instantiateViewControllerWithIdentifier:asset];
    // Show new view
    [_window makeKeyAndVisible];
    [_window.rootViewController presentViewController:newState animated:NO completion:NULL];
}

- (UIView *)getCurrentView {
    return [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
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

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
