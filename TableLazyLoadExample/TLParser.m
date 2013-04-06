//
//  TLParser.m
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import "TLParser.h"
#import "TLContact.h"

@interface TLParser()<NSXMLParserDelegate>
@property (strong, nonatomic) NSMutableArray* contacts;
@property (strong, nonatomic) TLContact* contact;
@property (strong, nonatomic) NSString* currentElement;
@end


@implementation TLParser
@synthesize contacts = _contacts;
@synthesize contact = _contact;

-(void)startParse:(NSData*)data
{
    _contacts = [[NSMutableArray alloc] init];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    [parser parse];
}

#pragma mark NSXMLParserDelegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    _currentElement = elementName;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    _currentElement = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if([_currentElement isEqualToString:@"firstName"]) {
        _contact = [TLContact new];
        [_contact setFirstName:string];
        [_contacts addObject:_contact];
    }
    else if([_currentElement isEqualToString:@"lastName"]) {
        [_contact setLastName:string];
    }
    else if([_currentElement isEqualToString:@"age"]) {
            [_contact setAge:string];
    }
    else if([_currentElement isEqualToString:@"sex"]) {
        if([string isEqualToString:@"m"]) {
            [_contact setSex:@"Male"];
        }
        else if([string isEqualToString:@"f"]) {
            [_contact setSex:@"Female"];
        }
        else {
            [_contact setSex:string];
        }        
    }
    else if([_currentElement isEqualToString:@"picture"]) {
        [_contact setPictureUrl:string];
    }
    else if([_currentElement isEqualToString:@"notes"]) {
        [_contact setNote:string];
        _contact = nil;
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{    
    [[NSNotificationCenter defaultCenter] postNotificationName:kDATA_RECEIVED_NOTIFICATION
                                                        object:_contacts
                                                      userInfo:nil];
}

@end
