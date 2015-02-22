/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "BackupViewController.h"

#import <QuartzCore/QuartzCore.h>

#include <sqlite3.h>

@implementation BackupViewController

- (id)init
{
    NSLog(@"BackupViewController.init Entered");

    self = [super init];
    
    UIColor* backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.view setBackgroundColor:backgroundColor];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Backup";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_contextLabel];
    
    UIFont* buttonFont = [UIFont systemFontOfSize:14];

    _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [_doneButton setBackgroundColor:[UIColor whiteColor]];
    [_doneButton setBackgroundColor:[UIColor whiteColor]];
    [_doneButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_doneButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_doneButton setEnabled:false];
    [_doneButton addTarget:self action:@selector(addPersonToDb) forControlEvents:UIControlEventTouchUpInside];
    _doneButton.frame = CGRectMake((self.view.frame.size.width / 2) + 10, 44 + 20 + 30 + 30, (self.view.frame.size.width / 2) - 30, 40);
    _doneButton.titleLabel.font = buttonFont;

    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.frame = CGRectMake(20, 44 + 20 + 30 + 30, (self.view.frame.size.width / 2) - 20, 40);
    [_cancelButton setBackgroundColor:[UIColor whiteColor]];
    [_cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_cancelButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = buttonFont;

    [self.view addSubview:_doneButton];
    [self.view addSubview:_cancelButton];

    NSLog(@"BackupViewController.init Exited");

    return self;
}

-(void)actionCall
{
    NSLog(@"BackupViewController.actionCall Entered");
    NSLog(@"BackupViewController.actionCall Exited");
}

-(void)textDidChange
{
  NSLog(@"BackupViewController.textDidChange Entered");
  NSLog(@"BackupViewController.textDidChange Exited");
}

-(void)textDidClear
{
  NSLog(@"BackupViewController.textDidClear Entered");
  NSLog(@"BackupViewController.textDidClear Exited");
}

-(void)addPersonToDb
{
  NSLog(@"BackupViewController.addPersonToDb Entered");
    
  //NSString* name = nameField.text;

    /*
    sqlite3* pDb = NULL;
    sqlite3_stmt* query = NULL;
    int ret = 0;
    do {
    if (SQLITE_OK != (ret = sqlite3_initialize()))
    {
        printf("Failed to initialize library: %d\n", ret);
        break;
    }
    
    if (SQLITE_OK != (ret = sqlite3_open_v2("personalstats.db", &pDb, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL)))
    {
        printf("Failed to open conn: %d\n", ret);
        break;
    }
    
    if (SQLITE_OK != (ret = sqlite3_prepare_v2(pDb, "SELECT 2012", -1, &query, NULL)))
    {
        printf("Failed to prepare insert: %d, %s\n", ret, sqlite3_errmsg(pDb));
        break;
    }
    } while (0);
    
    if (NULL != query) sqlite3_finalize(query);
    if (NULL != pDb) sqlite3_close(pDb);
    sqlite3_shutdown();
     */

  NSLog(@"BackupViewController.addPersonToDb Exited");
}

- (void)viewDidLoad
{
  NSLog(@"BackupViewController.viewDidLoad Entered");
  [super viewDidLoad];
  NSLog(@"BackupViewController.viewDidLoad Exited");
}

- (void)didReceiveMemoryWarning
{
  NSLog(@"BackupViewController.didReceiveMemoryWarning Entered");
  [super didReceiveMemoryWarning];
  NSLog(@"BackupViewController.didReceiveMemoryWarning Exited");
}

@end
