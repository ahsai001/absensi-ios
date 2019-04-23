//
//  LoginViewController.m
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import	"DashBoardTabBarController.h"
#import "ASTools.h"
#import	"ASConnection.h"
//#import "JSONKit.h"
#import "MyAbsenceAppAppDelegate.h"
#import	"StorageClass.h"

@implementation LoginViewController

@synthesize usernameField;
@synthesize passwordField;
@synthesize loginField;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		[self setTitle:@"Login Page"];
		[self.view setBackgroundColor:[UIColor magentaColor]]; 
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.view	endEditing:YES];
}

- (void) onClick:(id)sender{
	//[output setText:[NSString stringWithFormat:@"%@/%@",usernameField.text,passwordField.text]];
    ASConnection * conn = [[ASConnection alloc] initWithUrl:@"http://202.61.124.20:8270/tes/absen/api/login.php" andDelegate:self];
    [conn postData:@"username=ahmad.saifullah&password=doxgetron234"];
    //[conn postData:[NSString stringWithFormat:@"username=%@&password=%@",[usernameField text],[passwordField text]]];
}

- (void)connectionSuccessWith:(NSString *)receivedData{
	//[[ASTools class] showAlertsJustWithTitle:@"berhasil" andMessage:receivedData];
	NSDictionary * obj = [receivedData objectFromJSONString];
	int status = [[obj objectForKey:@"status"] intValue];
    if (status == 0) {
        [ASTools  showAlertsJustWithTitle:@"Login Failed" andMessage:@"username atau password anda salah"];
    } else if (status == 1) {
        [StorageClass getInstance].cookies = [obj	objectForKey:@"cookies"];
        DashBoardTabBarController * dbVC = [[DashBoardTabBarController alloc] initWithNibName:@"DashBoardTabBarController" bundle:nil];
        if (dbVC) {
            [self.navigationController pushViewController:dbVC animated:YES];
            //[[ASTools class] showAlertsJustWithTitle:@"holla" andMessage:@"sippppp"];
            [dbVC release];
        }
    }
	
}

- (void)connectionFailedWith:(NSString *)receivedError{
	[[ASTools class] showAlertsJustWithTitle:@"berhasil" andMessage:receivedError];
	

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
