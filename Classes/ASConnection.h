//
//  ASConnection.h
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

//#import <Foundation/Foundation.h>

//@class ASConnection;

@protocol ASConnectionDelegate <NSObject>
@required
-(void)connectionSuccessWith:(NSString *)receivedData;
-(void)connectionFailedWith:(NSString *)receivedError;
@end


@interface ASConnection : NSObject <NSURLProtocolClient>{
	NSMutableURLRequest * urlRequest;
	NSMutableData * responseData;
	id <ASConnectionDelegate> delegateObject;
}

@property (nonatomic, assign) id <ASConnectionDelegate> delegateObject;
- (id) initWithUrl:(NSString *)url andDelegate:(id)delegateObject;
- (void) postData:(NSString *)data;
@end
