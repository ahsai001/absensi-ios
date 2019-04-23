//
//  HarianViewController.m
//  MyAbsenceApp
//
//  Created by ahmad saifullah on 9/6/13.
//
//

#import "HarianViewController.h"
#import "ASTools.h"
#import "StorageClass.h"
#import "JSONKit.h"

@interface HarianViewController ()

@end

@implementation HarianViewController

@synthesize dataSource;
@synthesize tableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dataSource = nil;
    }
    return self;
}
-(void)refreshList:(id)sender{
    ASConnection * conn = [[ASConnection alloc] initWithUrl:@"http://202.61.124.20:8270/tes/absen/api/absen.php" andDelegate:self];
    [conn postData:[NSString stringWithFormat:@"cookies=%@",[StorageClass getInstance].cookies]];
}
- (void)connectionSuccessWith:(NSString *)receivedData{
    ASLog(@"data list : %@",receivedData);
    NSDictionary * jsonObject = [receivedData objectFromJSONString];
    NSDictionary * dataObject = [jsonObject objectForKey:@"data"];
    NSArray * dataItems = [dataObject objectForKey:@"item"];
    if (dataSource) {
        [dataSource release];
        dataSource = nil;
    }
    dataSource = [dataItems retain];
    [tableView reloadData];
}
- (void)connectionFailedWith:(NSString *)receivedError{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";

    NSInteger row = [indexPath row];
    NSArray * data = nil;
    if (dataSource) {
         data = [dataSource objectAtIndex:row];
    }
        
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    //cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    if (data) {
        [cell.textLabel setNumberOfLines:5];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        cell.textLabel.text = [NSString  stringWithFormat:@"%@\n%@\n%@\n%@\n%@", [data objectAtIndex:0],[data objectAtIndex:1],[data objectAtIndex:2],[data objectAtIndex:3],[data objectAtIndex:4]];
    } else {
        cell.textLabel.text = @"";
    }
    
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSUInteger count = 0;
    if (dataSource) {
        count = [dataSource count];
    }
    return count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *alertString = [NSString stringWithFormat:@"Clicked on row #%d", [indexPath row]];
    [ASTools showAlertsJustWithTitle:@"selected" andMessage:alertString];
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
- (void)dealloc{
    if (dataSource) {
        [dataSource release];
        dataSource = nil;
    }
    [super dealloc];
}
@end
