//
//  StorageClass.h
//  MyAbsenceApp
//
//  Created by ahmad on 9/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StorageClass : NSObject {
	NSString * cookies;
}
@property (nonatomic, retain) NSString * cookies;
+ (StorageClass *) getInstance;
@end
