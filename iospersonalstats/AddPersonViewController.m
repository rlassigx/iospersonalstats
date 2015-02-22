/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
*/
#import "AddPersonViewController.h"

#import <QuartzCore/QuartzCore.h>

#include <sqlite3.h>

@implementation AddPersonViewController

- (id)init
{
    NSLog(@"AddPersonViewController.init Entered");

    self = [super init];
    
    UIColor* backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.view setBackgroundColor:backgroundColor];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Add Entry";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_contextLabel];
    
    _givenNamesField = [[UITextField alloc] initWithFrame:CGRectMake(20, 44 + 20, self.view.frame.size.width - 40, 40)];
    _givenNamesField.borderStyle = UITextBorderStyleRoundedRect;

    _givenNamesField.borderStyle = UITextBorderStyleNone;
    _givenNamesField.backgroundColor = [UIColor whiteColor];
    _givenNamesField.layer.borderWidth = 1.0f;
    _givenNamesField.layer.cornerRadius = 8.0f;
    _givenNamesField.layer.borderColor = [[UIColor whiteColor] CGColor];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    _givenNamesField.leftView = paddingView;
    _givenNamesField.leftViewMode = UITextFieldViewModeAlways;
    _givenNamesField.font = [UIFont systemFontOfSize:15];
    _givenNamesField.placeholder = @"first name";
    _givenNamesField.autocorrectionType = UITextAutocorrectionTypeNo;
    _givenNamesField.keyboardType = UIKeyboardTypeDefault;
    _givenNamesField.returnKeyType = UIReturnKeyDone;
    _givenNamesField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_givenNamesField.layer setMasksToBounds:YES];
    _givenNamesField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_givenNamesField addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_givenNamesField];

    _surnameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 44 + 20 + 30 + 30, self.view.frame.size.width - 40, 40)];
    _surnameField.borderStyle = UITextBorderStyleRoundedRect;
    
    _surnameField.borderStyle = UITextBorderStyleNone;
    _surnameField.backgroundColor = [UIColor whiteColor];
    _surnameField.layer.borderWidth = 1.0f;
    _surnameField.layer.cornerRadius = 8.0f;
    _surnameField.layer.borderColor = [[UIColor whiteColor] CGColor];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    _surnameField.leftView = paddingView;
    _surnameField.leftViewMode = UITextFieldViewModeAlways;
    _surnameField.font = [UIFont systemFontOfSize:15];
    _surnameField.placeholder = @"last name";
    _surnameField.autocorrectionType = UITextAutocorrectionTypeNo;
    _surnameField.keyboardType = UIKeyboardTypeDefault;
    _surnameField.returnKeyType = UIReturnKeyDone;
    _surnameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_surnameField.layer setMasksToBounds:YES];
    _surnameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_surnameField addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_surnameField];

    UIFont* buttonFont = [UIFont systemFontOfSize:14];

    _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [_doneButton setBackgroundColor:[UIColor whiteColor]];
    [_doneButton setBackgroundColor:[UIColor whiteColor]];
    [_doneButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_doneButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_doneButton setEnabled:false];
    [_doneButton addTarget:self action:@selector(addPersonToDb) forControlEvents:UIControlEventTouchUpInside];
    _doneButton.frame = CGRectMake((self.view.frame.size.width / 2) + 10, 44 + 20 + 30 + 30 + 30 + 30, (self.view.frame.size.width / 2) - 30, 40);
    _doneButton.titleLabel.font = buttonFont;

    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.frame = CGRectMake(20, 44 + 20 + 30 + 30 + 30 + 30, (self.view.frame.size.width / 2) - 20, 40);
    [_cancelButton setBackgroundColor:[UIColor whiteColor]];
    [_cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_cancelButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = buttonFont;

    [self.view addSubview:_doneButton];
    [self.view addSubview:_cancelButton];

    NSLog(@"AddPersonViewController.init Exited");

    return self;
}

-(void)actionCall
{
    NSLog(@"AddPersonViewController.actionCall Entered");
    NSLog(@"AddPersonViewController.actionCall Exited");
}

-(void)textDidChange
{
  NSLog(@"AddPersonViewController.textDidChange Entered");
  NSString* name = _givenNamesField.text;
  NSString* surname = _surnameField.text;
  if (0 == name.length || 0 == surname.length) {
        [_doneButton setEnabled:false];
  } else {
        [_doneButton setEnabled:true];
  }
  NSLog(@"AddPersonViewController.textDidChange Exited");
}

-(void)textDidClear
{
  NSLog(@"AddPersonViewController.textDidClear Entered");
  NSLog(@"AddPersonViewController.textDidClear Exited");
}

-(void)addPersonToDb
{
  NSLog(@"AddPersonViewController.addPersonToDb Entered");
    
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

  NSLog(@"AddPersonViewController.addPersonToDb Exited");
}

- (void)viewDidLoad
{
  NSLog(@"AddPersonViewController.viewDidLoad Entered");
  [super viewDidLoad];
  NSLog(@"AddPersonViewController.viewDidLoad Exited");
}

- (void)didReceiveMemoryWarning
{
  NSLog(@"AddPersonViewController.didReceiveMemoryWarning Entered");
  [super didReceiveMemoryWarning];
  NSLog(@"AddPersonViewController.didReceiveMemoryWarning Exited");
}

@end
