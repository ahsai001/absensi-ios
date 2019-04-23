//
//  StorageClass.m
//  MyAbsenceApp
//
//  Created by ahmad on 9/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "StorageClass.h"


@implementation StorageClass

@synthesize cookies;

+ (StorageClass *) getInstance{
	static StorageClass * instance = nil;
	@synchronized(instance){
		if (instance == nil) {
			instance = [[StorageClass alloc] init];
		}
	}
	return instance;
}
@end
