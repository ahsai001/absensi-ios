//
//  MyAbsenceAppAppDelegate.h
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface MyAbsenceAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController * navCon;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController * navCon;

@end

