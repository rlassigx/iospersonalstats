/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "GraphView.h"

#import <QuartzCore/QuartzCore.h>

@implementation GraphView

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self setBackgroundColor:[UIColor clearColor]];
  }
  return self;
}

- (void)drawPoint:(CGContextRef)context x:(int)xCenter y:(int)yCenter {
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    int circleDiameter = 10;
    int radius = circleDiameter / 2;
    CGRect rectangle = CGRectMake(xCenter -  radius, yCenter - radius, circleDiameter, circleDiameter);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextDrawPath(context, kCGPathFillStroke); // Or kCGPathFill
}

- (void)drawGrid:(CGContextRef)context {
    UIColor* fillColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    CGContextSetLineWidth(context, 1.0);

    CGContextSetStrokeColorWithColor(context, fillColor.CGColor);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetStrokeColorWithColor(context, fillColor.CGColor);

    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, 240);

    CGContextMoveToPoint(context, 60, 0);
    CGContextAddLineToPoint(context, 60, 240);

    CGContextMoveToPoint(context, 120, 0);
    CGContextAddLineToPoint(context, 120, 240);

    CGContextMoveToPoint(context, 180, 0);
    CGContextAddLineToPoint(context, 180, 240);

    CGContextMoveToPoint(context, 240, 0);
    CGContextAddLineToPoint(context, 240, 240);

    CGContextMoveToPoint(context, 300, 0);
    CGContextAddLineToPoint(context, 300, 240);

    CGContextMoveToPoint(context, 0, 240);
    CGContextAddLineToPoint(context, 300, 240);
    
    CGContextMoveToPoint(context, 0, 180);
    CGContextAddLineToPoint(context, 300, 180);

    CGContextMoveToPoint(context, 0, 120);
    CGContextAddLineToPoint(context, 300, 120);

    CGContextMoveToPoint(context, 0, 60);
    CGContextAddLineToPoint(context, 300, 60);

    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 300, 0);

    CGContextStrokePath(context);
}

- (void)drawPoints:(CGContextRef)context {
    [self drawPoint:context x:0 y:30 + 40];
    [self drawPoint:context x:0 y:30 + 40];
    [self drawPoint:context x:30 y:60 + 40];
    [self drawPoint:context x:60 y:40 + 40];
    [self drawPoint:context x:90 y:100 + 40];
    [self drawPoint:context x:120 y:50 + 40];
    [self drawPoint:context x:150 y:50 + 40];
    [self drawPoint:context x:180 y:10 + 40];
    [self drawPoint:context x:210 y:50 + 40];
    [self drawPoint:context x:240 y:90 + 40];
    [self drawPoint:context x:270 y:120 + 40];
    [self drawPoint:context x:300 y:110 + 40];
}

- (void)fillPath:(CGContextRef)context {
    UIColor* fillColor = [[UIColor alloc]initWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    
    CGContextSetStrokeColorWithColor(context, fillColor.CGColor);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetStrokeColorWithColor(context, fillColor.CGColor);
    
    CGContextMoveToPoint(context, 0, 240);
    CGContextAddLineToPoint(context, 0, 30 + 40);
    CGContextAddLineToPoint(context, 30, 60 + 40);
    CGContextAddLineToPoint(context, 60, 40 + 40);
    CGContextAddLineToPoint(context, 90, 100 + 40);
    CGContextAddLineToPoint(context, 120, 50 + 40);
    CGContextAddLineToPoint(context, 150, 50 + 40);
    CGContextAddLineToPoint(context, 180, 10 + 40);
    CGContextAddLineToPoint(context, 210, 50 + 40);
    CGContextAddLineToPoint(context, 240, 90 + 40);
    CGContextAddLineToPoint(context, 270, 120 + 40);
    CGContextAddLineToPoint(context, 300, 110 + 40);
    CGContextAddLineToPoint(context, 300, 240);
    CGContextAddLineToPoint(context, 0, 240);
    
    CGContextFillPath(context);
}

- (void)drawPath:(CGContextRef)context {
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);

    CGContextMoveToPoint(context, 0, 30 + 40);
    CGContextAddLineToPoint(context, 30, 60 + 40);
    CGContextAddLineToPoint(context, 60, 40 + 40);
    CGContextAddLineToPoint(context, 90, 100 + 40);
    CGContextAddLineToPoint(context, 120, 50 + 40);
    CGContextAddLineToPoint(context, 150, 50 + 40);
    CGContextAddLineToPoint(context, 180, 10 + 40);
    CGContextAddLineToPoint(context, 210, 50 + 40);
    CGContextAddLineToPoint(context, 240, 90 + 40);
    CGContextAddLineToPoint(context, 270, 120 + 40);
    CGContextAddLineToPoint(context, 300, 110 + 40);

    CGContextStrokePath(context);
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGRect rectangle = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGContextSetLineWidth(context, 2.5);
    CGContextAddRect(context, rectangle);
    CGContextFillRect(context, rectangle);

    [self fillPath:context];
    [self drawGrid:context];
    [self drawPath:context];
    [self drawPoints:context];
    [self writeText:context text:@"19.20"];
    
    CGContextStrokePath(context);
    CGContextFillPath(context);
    UIGraphicsEndImageContext();
}

-(void)writeText:(CGContextRef)context text:(NSString *)text1{
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1);
    char* text = (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];
    CGContextSelectFont(context, "Arial", 12, kCGEncodingMacRoman);
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextShowTextAtPoint(context, 240, 65, text, strlen(text));
    CGContextShowTextAtPoint(context, 240, 125, text, strlen(text));
    CGContextShowTextAtPoint(context, 240, 185, text, strlen(text));
    CGContextShowTextAtPoint(context, 240, 245, text, strlen(text));
}


-(UIImage *)addText:(UIImage *)img text:(NSString *)text1{
    int w = img.size.width;
    int h = img.size.height;
    //lon = h - lon;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1);
	
    char* text	= (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];// "05/05/09";
    CGContextSelectFont(context, "Arial", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
	
    
    //rotate text
    CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
	
    CGContextShowTextAtPoint(context, 4, 52, text, strlen(text));
	
	
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
	
    return [UIImage imageWithCGImage:imageMasked];
}


@end
