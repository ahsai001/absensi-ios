//
//  DashBoardTabBarController.m
//  MyAbsenceApp
//
//  Created by ahmad saifullah on 9/6/13.
//
//

#import "DashBoardTabBarController.h"
#import "HarianViewController.h"
#import "BulananViewController.h"

@interface DashBoardTabBarController ()

@end

@implementation DashBoardTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"Main Page"];
        HarianViewController * harianVC = [[HarianViewController alloc] initWithNibName:@"HarianViewController" bundle:nil];
        [[harianVC tabBarItem] setTitle:@"Harian"]; 
        BulananViewController * bulananVC = [[BulananViewController alloc] initWithNibName:@"BulananViewController" bundle:nil];
        [[bulananVC tabBarItem] setTitle:@"Bulanan"];
        NSArray * VCs = [[NSArray alloc] initWithObjects:harianVC,bulananVC, nil];
        [self setViewControllers:VCs animated:YES];
        [harianVC release];
        [bulananVC  release];
        [VCs release];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
