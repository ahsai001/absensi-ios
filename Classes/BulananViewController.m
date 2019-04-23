//
//  BulananViewController.m
//  MyAbsenceApp
//
//  Created by ahmad saifullah on 9/6/13.
//
//

#import "BulananViewController.h"
#import "ASConnection.h"
#import "StorageClass.h"
#import "JSONKit.h"
#import "ASTools.h"

@interface BulananViewController ()

@end

@implementation BulananViewController

@synthesize dataSource;
@synthesize tableView;
NSInteger buttIndex;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dataSource = nil;
        
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
- (void)dateClick:(id)sender{
    UIActionSheet * pickerSheet = [[UIActionSheet alloc] initWithTitle:@"Select Date :" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:@"Done" otherButtonTitles: nil];
    [pickerSheet showInView:self.view];
    [pickerSheet setFrame:CGRectMake(0, 100, 320, 500)];
    UIDatePicker * datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, 100, 200)];
    [datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [pickerSheet addSubview:datePicker];
    [datePicker release];
    [pickerSheet release];
}
- (void)loadClick:(id)sender{
    NSString * date = [dateBut titleForState:UIControlStateNormal];
    NSArray * dateArray = [date componentsSeparatedByString:@"/"];
    NSString * month = [dateArray objectAtIndex:0];
    NSString * year = [@"20" stringByAppendingString:[dateArray objectAtIndex:2]];
    if ([month length] == 1) {
        NSString * endS = month;
        month = [@"0" stringByAppendingString:endS];
    }
    ASLog(@"month = %@",month);
     ASLog(@"year = %@",year);
    ASConnection * conn = [[ASConnection alloc] initWithUrl:@"http://202.61.124.20:8270/tes/absen/api/list.php" andDelegate:self];
    [conn postData:[NSString stringWithFormat:@"cookies=%@&tahun=%@&bulan=%@",[StorageClass getInstance].cookies,year,month]];
}

- (void)connectionSuccessWith:(NSString *)receivedData{
    ASLog(@"data list : %@",receivedData);
    NSDictionary * jsonObject = [receivedData objectFromJSONString];
    NSDictionary * dataObject = [jsonObject objectForKey:@"data"];
    NSArray * dataItems = [dataObject objectForKey:@"item"];
    ASLog(@"data count 1 : %d",[dataItems count]);
    if (dataSource) {
        [dataSource release];
        dataSource = nil;
    }
    dataSource = [dataItems retain];
   
    [tableView reloadData];
    ASLog(@"data count 2: %d",[dataSource count]);
}
-(void)connectionFailedWith:(NSString *)receivedError{

}

- (void) datePickerChanged:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterShortStyle;
	NSString * dateString = [NSString stringWithFormat:@"%@",[df stringFromDate:((UIDatePicker*)sender).date]];
    ASLog(@"%@",dateString);
    [dateBut setTitle:dateString forState:UIControlStateNormal];
	[df release];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    ASLog(@"get View");
    NSInteger row = [indexPath row];
    NSArray * data = nil;
    if (dataSource) {
        data = [dataSource objectAtIndex:row];
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    if (data) {
        [cell.textLabel setNumberOfLines:5];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        cell.textLabel.text = [NSString  stringWithFormat:@"%@\n%@\n%@", [data objectAtIndex:0],[data objectAtIndex:1],[data objectAtIndex:2]];
    } else {
        cell.textLabel.text = @"";
    }
    
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSUInteger count = 0;
    ASLog(@"get count");
    if (dataSource) {
        count = [dataSource count];
    }
     ASLog(@"data count 2: %d",count);
    return count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    ASLog(@"get sectin count");
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

@end
