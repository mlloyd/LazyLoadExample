//
//  UILabel+Resize.m
//
//  Created by Martin Lloyd on 14/01/2013.
//

#import "UILabel+Resize.h"

@implementation UILabel (Resize)

- (void)resizeLabel:(CGSize)maxSize
{
    CGSize size = [self.text sizeWithFont:self.font
                   constrainedToSize:maxSize
                   lineBreakMode:UILineBreakModeWordWrap];

    CGRect frame = self.frame;
    frame.size.height = size.height;
    [self setFrame:frame];
}

@end
