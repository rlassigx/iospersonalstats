//
//  OpenGLView.m
//  HelloOpenGL
//
//  Created by Ray Wenderlich on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIExtendedViewController.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIExtendedViewController

-(UIImage*)snapshot
{
    NSLog(@"UIExtendedView.snapshot Entered");

    CGSize viewSize = self.view.layer.bounds.size;
    UIGraphicsBeginImageContextWithOptions(viewSize, NO, 1.0);
    CALayer* layer = self.view.layer;
    [layer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    NSLog(@"UIExtendedView.snapshot Exited");

    return image;
}

@end
