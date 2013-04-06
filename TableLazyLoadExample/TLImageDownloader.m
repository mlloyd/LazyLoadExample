//
//  TLImageDownloader.m
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import "TLImageDownloader.h"

@interface TLImageDownloader()

@end

@implementation TLImageDownloader
//
//- (id)initWithTarget:(id)trgt selector:(SEL)sel withImgURL:(NSString *)url {
//    if(self = [super init]) {
//        if(url == nil || [url isEqualToString:@""])
//            return nil;
//        target = trgt;
//        action = sel;
//        imgURL = [[NSURL alloc] initWithString: url];
//    }
//    return self;
//}
//
//- (void)main {
//    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
//}
//
//- (void)loadImage {
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    UIImage *img = [UIImage imageNamed: @"default_user.png"];
//    if(![[imgURL absoluteString] isEqualToString: @"0"]) {
//        NSData *imgData = [NSData dataWithContentsOfURL: imgURL];
//        img = [UIImage imageWithData: imgData];
//    }
//    if([target respondsToSelector: action])
//        [target performSelectorOnMainThread: action withObject: img waitUntilDone: YES];
//    [pool release];
//}
//
//- (void)dealloc {
//    [imgURL release];
//    [super dealloc];
//}

@end
