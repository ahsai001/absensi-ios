//
//  ASTools.h
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ASTools : NSObject {
}
void ASLog(NSString *format, ...); // c-function, not objective-c method
+ (void)showAlertWithTitle:(NSString *)title message:(NSString*)message delegate:(id)delegateObject cancelButtonTitle:(NSString *)cancelTitle othersButtonTitle:(NSString *)othersTitle;
+ (void)showAlertsJustWithTitle:(NSString *)title andMessage:(NSString *)message;

@end
