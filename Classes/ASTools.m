//
//  ASTools.m
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ASTools.h"
//#import <UIKit/UIKit.h>

@implementation ASTools

void ASLog(NSString *format, ...){
    va_list args;
    va_start(args, format);
    NSLogv(format, args);
    va_end(args);
}
+ (void) showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegateObject cancelButtonTitle:(NSString *)cancelTitle othersButtonTitle:(NSString *)othersTitle{
	UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegateObject cancelButtonTitle:cancelTitle otherButtonTitles:othersTitle];
	[[alert autorelease] show];
}
+ (void) showAlertsJustWithTitle:(NSString *)title andMessage:(NSString *)message{
	[[self	class] showAlertWithTitle:title message:message delegate:nil cancelButtonTitle:@"Close" othersButtonTitle:nil];
}


@end
