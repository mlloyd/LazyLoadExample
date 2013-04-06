//
//  TLRootViewController.m
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import "TLRootViewController.h"
#import "TLDetailedViewController.h"
#import "TLContact.h"

static NSString* const kTLContactCell = @"TLContactCell";

static NSUInteger const kPhotoTag = 1;
static NSUInteger const kNameTag  = 2;
static NSUInteger const kSexTag   = 3;
static NSUInteger const kAgeTag   = 4;

@interface TLRootViewController ()
@property (strong, nonatomic) NSArray* contacts;
@end

@implementation TLRootViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Lazy Load Demo";
    
    [self.tableView registerNib:[UINib nibWithNibName:kTLContactCell bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kTLContactCell];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataReceived:)
                                                 name:kDATA_RECEIVED_NOTIFICATION
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTLContactCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTLContactCell];
    }
    
    TLContact* contact = (TLContact*)[_contacts objectAtIndex:[indexPath row]];
    
    // Configure the cell...
    UILabel* nameLabel = (UILabel*)[cell viewWithTag:kNameTag];
    [nameLabel setText:[NSString stringWithFormat:@"%@ %@", [contact firstName], [contact lastName]]];
    
    UILabel* sexLabel = (UILabel*)[cell viewWithTag:kSexTag];
    [sexLabel setText:[contact sex]];
    
    UILabel* ageLabel = (UILabel*)[cell viewWithTag:kAgeTag];
    [ageLabel setText:[contact age]];
    
    UIImageView* image = (UIImageView*)[cell viewWithTag:kPhotoTag];
    
    // Lazy load images!!
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[contact pictureUrl]]];
        UIImage* img = [UIImage imageWithData:imgData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [image setImage:img];
            [contact setImage:img];
        });
    });
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    TLContact* contact = (TLContact*)[_contacts objectAtIndex:[indexPath row]];
    
    TLDetailedViewController *detailViewController = [[TLDetailedViewController alloc] initWithContact:contact];

    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma Data
-(void) dataReceived:(NSNotification *)notification
{
    self.contacts = (NSArray*)[notification object];
    [self.tableView reloadData];
}

@end
