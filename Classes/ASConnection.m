//
//  ASConnection.m
//  MyAbsenceApp
//
//  Created by ahmad on 9/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ASConnection.h"
#import "ASTools.h"

@implementation ASConnection

@synthesize delegateObject;

- (id) initWithUrl:(NSString *)url andDelegate:(id)delegateObject{
	if ((self = [super init])) {
		urlRequest = [NSMutableURLRequest requestWithURL:[NSURL	URLWithString:url]];
		[urlRequest setTimeoutInterval:30];
		[urlRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
		self.delegateObject = delegateObject;
		responseData = nil;
	}
	return self;
}

- (void) postData:(NSString *)data{
	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest	setHTTPBody:[data	dataUsingEncoding:NSUTF8StringEncoding]];
	[[[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:YES] autorelease];
    [self autorelease];//if postData send, autorelease set
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	[responseData appendData:data];
}
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	responseData = [[NSMutableData data] retain];
	[responseData setLength:0];
}
- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	ASLog(@"Connection Error: %@", [error localizedDescription]);
	if ([self.delegateObject respondsToSelector:@selector(connectionFailedWith:)]) {
		[self.delegateObject connectionFailedWith:[error localizedDescription]];
	}
}
- (void) connectionDidFinishLoading:(NSURLConnection *)connection{
	NSString * receivedData = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	ASLog(@"received Data : %@",receivedData);
	if ([self.delegateObject respondsToSelector:@selector(connectionSuccessWith:)]) {
		[self.delegateObject connectionSuccessWith:receivedData];
	}
	[receivedData release];
}

- (void) dealloc {
	[super dealloc];
	if (responseData) {
		[responseData release];
	}
}
@end
