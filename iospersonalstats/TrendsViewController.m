/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "TrendsViewController.h"

#import "MenuButton.h"
#import "ProfileButton.h"
#import "GraphView.h"

@implementation TrendsViewController

- (id)init
{
    NSLog(@"TrendsViewController.init Entered");

    self = [super init];

    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44))];
    UIColor* backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [view setBackgroundColor:backgroundColor];
    [self.view addSubview:view];
    
    _backButton = [[ProfileButton alloc] initWithFrame:CGRectMake(5, 5, 40, 30)];
    _menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 45, 5, 40, 30)];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Trends";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;

    UIView *topView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [topView setBackgroundColor:backgroundColor];
    [topView addSubview:self.menuButton];
    [topView addSubview:self.backButton];
    [topView addSubview:_contextLabel];
    [self.view addSubview:topView];

    UIView *nameView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [nameView setBackgroundColor:[UIColor darkGrayColor]];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Jane";
    _contextLabel.textColor = [UIColor whiteColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;
    [nameView addSubview:_contextLabel];

    GraphView *graphView = [[GraphView alloc] initWithFrame:(CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.width))];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor whiteColor];
    _contextLabel.text = @"Waist";
    _contextLabel.textAlignment = NSTextAlignmentCenter;
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [scrollView setScrollEnabled:true];
    [scrollView setBackgroundColor:backgroundColor];
    [scrollView addSubview:graphView];
    [scrollView addSubview:nameView];
    [scrollView addSubview:_contextLabel];

    
    [self.view addSubview:scrollView];
    
    NSLog(@"TrendsViewController.init Exited");

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)displayInsertNameAlert
{
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"TrendsViewController.didReceiveMemoryWarning Entered");
    [super didReceiveMemoryWarning];
    NSLog(@"TrendsViewController.didReceiveMemoryWarning Exited");
}

@end
