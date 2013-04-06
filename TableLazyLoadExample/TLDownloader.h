//
//  TLDownloader.h
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLDownloader : NSObject

+ (TLDownloader*) sharedInstance;
- (void)downloadDataFromUrlString:(NSString*)urlString;

@end
