//
//  HarianViewController.h
//  MyAbsenceApp
//
//  Created by ahmad saifullah on 9/6/13.
//
//

#import <UIKit/UIKit.h>
#import "ASConnection.h"

@interface HarianViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, ASConnectionDelegate>{
    NSArray * dataSource;
    UITableView * tableView;
}
@property (nonatomic,retain) NSArray * dataSource;
@property  (nonatomic,retain) IBOutlet UITableView * tableView;
- (IBAction)refreshList:(id)sender;
@end
