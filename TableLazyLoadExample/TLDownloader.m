//
//  TLDownloader.m
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import "TLDownloader.h"
#import "TLParser.h"

// Singleton instance.
static TLDownloader* instance;

@interface TLDownloader()
@property (strong, nonatomic) NSMutableData* data;
@property (strong, nonatomic) TLParser* parser;
@end

@implementation TLDownloader
@synthesize  parser = _parser;

+ (TLDownloader*) sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [TLDownloader new];
    });
    
    return instance;
}

- (void)downloadDataFromUrlString:(NSString*)urlString
{
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    [connection start];
}

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
    _data = [NSMutableData new];
}
-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    [_data appendData:data];
}
-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    // Handle the error
}
-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    _parser = [TLParser new];
    [_parser startParse:_data];    
}

@end
