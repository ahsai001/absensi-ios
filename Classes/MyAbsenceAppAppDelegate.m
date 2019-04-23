//
//  MyAbsenceAppAppDelegate.m
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import "MyAbsenceAppAppDelegate.h"
#import	"LoginViewController.h"

@implementation MyAbsenceAppAppDelegate

@synthesize window;
@synthesize navCon;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after application launch
	LoginViewController	* loginVC = [[LoginViewController alloc] initWithNibName:@"loginVC" bundle:nil];
	if (loginVC) {
		NSArray * vcs = [NSArray arrayWithObjects:loginVC, nil];
		[navCon setViewControllers:vcs];
		[loginVC release];
	}
	
	[window addSubview:[navCon view]];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
	[navCon	release];
    [window release];
    [super dealloc];
}


@end
