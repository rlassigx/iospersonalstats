/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "ShareViewController.h"

#import <QuartzCore/QuartzCore.h>

#include <sqlite3.h>

@implementation ShareViewController

- (id)init
{
    NSLog(@"ShareViewController.init Entered");

    self = [super init];
    
    _backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.view setBackgroundColor:_backgroundColor];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Share";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_contextLabel];
    
    _buttonFont = [UIFont systemFontOfSize:14];

    _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [_doneButton setBackgroundColor:[UIColor whiteColor]];
    [_doneButton setBackgroundColor:[UIColor whiteColor]];
    [_doneButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_doneButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_doneButton setEnabled:false];
    [_doneButton addTarget:self action:@selector(addPersonToDb) forControlEvents:UIControlEventTouchUpInside];
    _doneButton.frame = CGRectMake((self.view.frame.size.width / 2) + 10, 44 + 20 + 30 + 30, (self.view.frame.size.width / 2) - 30, 40);
    _doneButton.titleLabel.font = _buttonFont;

    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.frame = CGRectMake(20, 44 + 20 + 30 + 30, (self.view.frame.size.width / 2) - 20, 40);
    [_cancelButton setBackgroundColor:[UIColor whiteColor]];
    [_cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_cancelButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = _buttonFont;

    [self.view addSubview:_doneButton];
    [self.view addSubview:_cancelButton];

    NSLog(@"ShareViewController.init Exited");

    return self;
}

-(void)actionCall
{
    NSLog(@"ShareViewController.actionCall Entered");
    NSLog(@"ShareViewController.actionCall Exited");
}

-(void)textDidChange
{
  NSLog(@"ShareViewController.textDidChange Entered");
  NSLog(@"ShareViewController.textDidChange Exited");
}

-(void)textDidClear
{
  NSLog(@"ShareViewController.textDidClear Entered");
  NSLog(@"ShareViewController.textDidClear Exited");
}

-(void)addPersonToDb
{
  NSLog(@"ShareViewController.addPersonToDb Entered");
  NSLog(@"ShareViewController.addPersonToDb Exited");
}

- (void)viewDidLoad
{
  NSLog(@"ShareViewController.viewDidLoad Entered");
  [super viewDidLoad];
  NSLog(@"ShareViewController.viewDidLoad Exited");
}

- (void)didReceiveMemoryWarning
{
  NSLog(@"ShareViewController.didReceiveMemoryWarning Entered");
  [super didReceiveMemoryWarning];
  NSLog(@"ShareViewController.didReceiveMemoryWarning Exited");
}

@end
