//
//  TextField + CustomPlaceholder.m
//  PhotoMeta
//
//  Created by sky-mac on 9/15/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import "TextField + CustomPlaceholder.h"

@implementation TextField___CustomPlaceholder
- (void) drawPlaceholderInRect:(CGRect) rect

{
    [[UIColor colorWithRed:8.0f/255.0f green:25.0f/255.0f blue:62.0/255.0f alpha:1.0f] setFill];
    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:19]];
    [[UITextField appearance] setTintColor:[UIColor blackColor]];
}
@end
