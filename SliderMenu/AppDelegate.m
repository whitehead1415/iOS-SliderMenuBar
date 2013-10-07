//
//  AppDelegate.m
//  SliderMenu
//
//  Created by michael whitehead on 10/3/13.
//  Copyright (c) 2013 michael whitehead. All rights reserved.
//

#import "AppDelegate.h"
#import "SliderMenuItem.h"
#import "SliderViewController.h"
#import "SliderMenuController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIColor *darkBlue = [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];
    UIColor *lightBlue = [UIColor colorWithRed:109.0/255.0 green:188.0/255.0 blue:219.0/255.0 alpha:1.0];
    UIColor *red = [UIColor colorWithRed:252.0/255.0 green:63.0/255.0 blue:73.0/255.0 alpha:1.0];

    SliderMenuItem *item1 = [[SliderMenuItem alloc] initWithImage:nil title:@"FOO" color:darkBlue];
    SliderMenuItem *item2 = [[SliderMenuItem alloc] initWithImage:nil title:@"BAR" color:red];
    SliderMenuItem *item3 = [[SliderMenuItem alloc] initWithImage:nil title:@"BAZ" color:lightBlue];

    SliderViewController *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"View1"];
    SliderViewController *vc2 = [storyboard instantiateViewControllerWithIdentifier:@"View2"];
    SliderViewController *vc3 = [storyboard instantiateViewControllerWithIdentifier:@"View3"];

    vc1.sliderMenuItem = item1;
    vc2.sliderMenuItem = item2;
    vc3.sliderMenuItem = item3;
    
    NSArray *vcs = [[NSArray alloc] initWithObjects:vc1, vc2, vc3, nil];
    SliderMenuController *controller = [[SliderMenuController alloc] initWithSliderViewControllers:vcs];
    controller.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = controller;
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
