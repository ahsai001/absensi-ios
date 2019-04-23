//
//  LoginViewController.h
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASConnection.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate, ASConnectionDelegate> {
	UITextField * usernameField;
	UITextField * passwordField;
	UIButton * loginField;
	IBOutlet UILabel * output;
}

@property (nonatomic, retain) IBOutlet UITextField * usernameField;
@property (nonatomic, retain) IBOutlet UITextField * passwordField;
@property (nonatomic, retain) IBOutlet UIButton * loginField;

- (IBAction) onClick:(id)sender;
@end
