//
//  TLDetailedViewController.m
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import "TLDetailedViewController.h"
#import "TLContact.h"
#import "UILabel+Resize.h"

@interface TLDetailedViewController ()
@property (weak, nonatomic) TLContact* contact;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *notes;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@end

@implementation TLDetailedViewController
@synthesize contact = _contact;

- (id)initWithContact:(TLContact *)contact
{
    self = [super initWithNibName:@"TLDetailedViewController" bundle:nil];
    if (self) {
        // Custom initialization
        _contact = contact;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.name.text = [NSString stringWithFormat:@"%@ %@", [_contact firstName], [_contact lastName]];
    self.notes.text = [_contact note];
    [self.photo setImage:[_contact image]];
    
    [self.notes resizeLabel:self.notes.frame.size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
