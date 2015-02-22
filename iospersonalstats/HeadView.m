/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "HeadView.h"

#import <QuartzCore/QuartzCore.h>

@implementation HeadView

- (id)initWithFrameAndDiameter:(CGRect)frame diameter:(int)theDiameter color:(UIColor*)theColor {
  if (self = [super initWithFrame:frame]) {
    [self setBackgroundColor:[UIColor clearColor]];
  }
  _circleDiameter = theDiameter;
  _circleColor = theColor;
  return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextSetFillColorWithColor(context, _circleColor.CGColor);
    int radius = _circleDiameter / 2;
    int xCenter = self.frame.size.width / 2;
    int yCenter = self.frame.size.height / 2;
    CGRect rectangle = CGRectMake(xCenter -  radius, yCenter - radius, _circleDiameter, _circleDiameter);
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextDrawPath(context, kCGPathFillStroke); // Or kCGPathFill

    UIGraphicsEndImageContext();
}

@end
