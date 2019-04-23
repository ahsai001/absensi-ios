//
//  BulananViewController.h
//  MyAbsenceApp
//
//  Created by ahmad saifullah on 9/6/13.
//
//

#import <UIKit/UIKit.h>
#import "ASConnection.h"

@interface BulananViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, ASConnectionDelegate>{
    IBOutlet UIButton * dateBut;
    IBOutlet UIButton * loadBut;
    NSArray * dataSource;
    UITableView * tableView;
}
@property (nonatomic,retain) NSArray * dataSource;
@property  (nonatomic,retain) IBOutlet UITableView * tableView;
- (IBAction) dateClick :(id)sender;
- (IBAction) loadClick :(id)sender;
@end
