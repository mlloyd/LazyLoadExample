//
//  TLContact.h
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLContact : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* age;
@property (strong, nonatomic) NSString* sex;
@property (strong, nonatomic) NSString* pictureUrl;
@property (strong, nonatomic) NSString* note;
@property (strong, nonatomic) UIImage* image;

@end
