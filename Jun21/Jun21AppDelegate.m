//
//  Jun21AppDelegate.m
//  Jun21
//
//  Created by Michael Compas on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Jun21AppDelegate.h"
#import "View.h"

@implementation Jun21AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIScreen *screen = [UIScreen mainScreen];
	CGRect bounds = screen.bounds;
	CGFloat sw = bounds.size.width;
	CGFloat sh = bounds.size.height;
	CGRect applicationFrame = CGRectMake(0, 0, sw, sh);
	
	// make root window
	self.window = [[UIWindow alloc] initWithFrame:applicationFrame];
    
	// define custom colors for components
	// this is separate from the default colors used in the view class
	UIColor *bodyColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:1];
	
	// define frame sizes for components (excluding body)
	
	
	// make components
    View *body = [[View alloc] initWithFrame:applicationFrame];
	body.backgroundColor = bodyColor;
	
	View *deckA = [[View alloc] initDeckWithRadius:150 atPoint:CGPointMake(40, 40)];
	View *deckB = [[View alloc] initDeckWithRadius:150 atPoint:CGPointMake(40, (480-150-40))];
	
	int range = 100;
	int crossFaderY = (480-range)/2;
	View *crossFader = [[View alloc] initFaderWithRange:range andSliderHeight:20 atPoint:CGPointMake(10, crossFaderY)];
	
	View *pitchFaderA = [[View alloc] initFaderWithRange:150 andSliderHeight:10 atPoint:CGPointMake(110, -60)];
	View *pitchFaderB = [[View alloc] initFaderWithRange:150 andSliderHeight:10 atPoint:CGPointMake(110, 390)];
	// use this to rotate the view after it's been created
	// however, since the origin is in the center, the transformation is rotating it around the center
	// this is causing issues with the x,y placement of where the frame is vs. the x,y of the origin
	// 
	
	CGAffineTransform t = CGAffineTransformMakeRotation(90 * M_PI / 180);
	pitchFaderA.transform = t;
	pitchFaderB.transform = t;
	
	// add components to window
	[self.window addSubview:body];
	[self.window addSubview:deckA];
	[self.window addSubview:deckB];
	[self.window addSubview:crossFader];
	[self.window addSubview:pitchFaderA];
	[self.window addSubview:pitchFaderB];
	
	// add root window to show everything
	[self.window makeKeyAndVisible];
    return YES;
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
