//
//  TLAppDelegate.h
//  TableLazyLoadExample
//
//  Created by Martin Lloyd on 06/04/2013.
//  Copyright (c) 2013 Martin Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLRootViewController;

@interface TLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TLRootViewController *viewController;

@end
