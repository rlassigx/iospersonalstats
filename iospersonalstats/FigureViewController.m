/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "FigureViewController.h"

#import "ObjLoader.h"
#import "MenuButton.h"
#import "ProfileButton.h"

@implementation FigureViewController

- (id)init
{
    self = [super init];

    NSString * path = [[NSBundle mainBundle] pathForResource:  @"malebody" ofType: @"obj"];
    const char* cpath = [path cStringUsingEncoding:1];
    Model* result = loadFile(cpath);
    if (0 != result) {
        NSLog(@"Success loading obj file");
    } else {
        NSLog(@"Failed load obj");
    }

    UIColor* backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.view setBackgroundColor:backgroundColor];

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    screenBounds.origin.y = screenBounds.origin.y + 44;
    screenBounds.size.height = screenBounds.size.height - 44;
    self.glView = [[OpenGLView alloc] initWithFrameAndModel:screenBounds model:result];
    [self.view addSubview:self.glView];

    UIView *topView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [topView setBackgroundColor:backgroundColor];

    _menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(screenBounds.size.width - 45, 5, 40, 30)];
    _backButton = [[ProfileButton alloc] initWithFrame:CGRectMake(5, 5, 40, 30)];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Figure";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;

    [topView addSubview:self.menuButton];
    [topView addSubview:self.backButton];
    [topView addSubview:_contextLabel];
    [self.view addSubview:topView];

    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage*)snapshot
{
    NSLog(@"FigureViewController.snapshot Entered");
    NSLog(@"FigureViewController.snapshot Exited");
    return [self.glView snapshot];
}

@end
