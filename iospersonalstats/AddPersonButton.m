/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
*/
#import "AddPersonButton.h"

#import <QuartzCore/QuartzCore.h>

@implementation AddPersonButton

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self setBackgroundColor:[UIColor clearColor]];
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGRect rectangle = CGRectMake(13,6,3,20);
    CGContextSetLineWidth(context, 1.0);
    CGContextFillRect(context, rectangle);
    
    rectangle = CGRectMake(5,14,20,3);
    CGContextSetLineWidth(context, 1.0);
    CGContextFillRect(context, rectangle);
    
    CGContextStrokePath(context);
    UIGraphicsEndImageContext();
}

@end
