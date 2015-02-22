/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "RecoverViewController.h"

#import <QuartzCore/QuartzCore.h>

#include <sqlite3.h>

@implementation RecoverViewController

- (id)init
{
    NSLog(@"RecoverViewController.init Entered");

    self = [super init];
    
    UIColor* backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.view setBackgroundColor:backgroundColor];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Recover";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_contextLabel];
    
    _nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 44 + 20, self.view.frame.size.width - 40, 40)];
    _nameField.borderStyle = UITextBorderStyleRoundedRect;

    _nameField.borderStyle = UITextBorderStyleNone;
    _nameField.backgroundColor = [UIColor whiteColor];
    _nameField.layer.borderWidth = 1.0f;
    _nameField.layer.cornerRadius = 8.0f;
    _nameField.layer.borderColor = [[UIColor whiteColor] CGColor];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    _nameField.leftView = paddingView;
    _nameField.leftViewMode = UITextFieldViewModeAlways;
    _nameField.font = [UIFont systemFontOfSize:15];
    _nameField.placeholder = @"name";
    _nameField.autocorrectionType = UITextAutocorrectionTypeNo;
    _nameField.keyboardType = UIKeyboardTypeDefault;
    _nameField.returnKeyType = UIReturnKeyDone;
    _nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_nameField.layer setMasksToBounds:YES];
    _nameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_nameField addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_nameField];

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

    NSLog(@"RecoverViewController.init Exited");

    return self;
}

-(void)actionCall
{
    NSLog(@"RecoverViewController.actionCall Entered");
    NSLog(@"RecoverViewController.actionCall Exited");
}

-(void)textDidChange
{
  NSLog(@"RecoverViewController.textDidChange Entered");
  NSString *name = _nameField.text;
  NSLog(name);

  if (0 == name.length) {
        [_doneButton setEnabled:false];
  } else {
        [_doneButton setEnabled:true];
  }
  NSLog(@"RecoverViewController.textDidChange Exited");
}

-(void)textDidClear
{
  NSLog(@"RecoverViewController.textDidClear Entered");
  NSLog(@"RecoverViewController.textDidClear Exited");
}

-(void)addPersonToDb
{
  NSLog(@"RecoverViewController.addPersonToDb Entered");
    
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

  NSLog(@"RecoverViewController.addPersonToDb Exited");
}

- (void)viewDidLoad
{
  NSLog(@"RecoverViewController.viewDidLoad Entered");
  [super viewDidLoad];
  NSLog(@"RecoverViewController.viewDidLoad Exited");
}

- (void)didReceiveMemoryWarning
{
  NSLog(@"RecoverViewController.didReceiveMemoryWarning Entered");
  [super didReceiveMemoryWarning];
  NSLog(@"RecoverViewController.didReceiveMemoryWarning Exited");
}

@end
