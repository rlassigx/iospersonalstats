/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "MenuButton.h"

#import <QuartzCore/QuartzCore.h>

@implementation MenuButton

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {

    [self setBackgroundColor:[UIColor clearColor]];
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 2.0);
  CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
  CGRect rectangle = CGRectMake(10,10,20,2);
  CGContextAddRect(context, rectangle);
  rectangle = CGRectMake(10,16,20,2);
    CGContextAddRect(context, rectangle);
  rectangle = CGRectMake(10,22,20,2);
    CGContextAddRect(context, rectangle);
  CGContextStrokePath(context);
    UIGraphicsEndImageContext();
}

@end
