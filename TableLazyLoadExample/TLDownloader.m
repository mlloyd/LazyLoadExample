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
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError* error){
        _parser = [TLParser new];
        [_parser startParse:data];
    }];
}

@end
