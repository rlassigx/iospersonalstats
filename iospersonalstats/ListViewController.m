/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "ListViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "MenuButton.h"
#import "AddPersonButton.h"

@implementation ListViewController

- (id)init
{
    NSLog(@"ListViewController.initWithNibName Entered");

    self = [super init];

    _tableData = [[NSArray alloc] initWithObjects: @"John", @"Mark", @"Mary", @"Sally", @"Sarah", @"Sonny", @"Tim", nil];

    _table = [[UITableView alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44)) style:UITableViewStylePlain];
    _backView = [[UIView alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44))];
    [_backView setBackgroundColor:[UIColor whiteColor]];
    [_table setBackgroundView:_backView];
    _tableFont = [UIFont systemFontOfSize:14];
   // tableFont = [UIFont fontWithName:@"NexaLight" size:20];
    _table.dataSource = self;
    _table.delegate = self;
    [_table setSeparatorColor:[UIColor whiteColor]];
    [_table setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_table];

    _cellBackground = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [_cellBackground setBackgroundColor:[UIColor whiteColor]];

    _cellBackgroundSelected = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [_cellBackgroundSelected setBackgroundColor:[UIColor lightGrayColor]];

    _menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(5, 5, 40, 30)];
    _addPersonButton = [[AddPersonButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 40, 7, 40, 30)];

    _topView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [_topView setBackgroundColor:_backgroundColor];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 42))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"List";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;

    [_topView addSubview:_menuButton];
    [_topView addSubview:_addPersonButton];
    [_topView addSubview:_contextLabel];

    [self.view addSubview:_topView];

    self.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;

    NSLog(@"ListViewController.initWithNibName Exited");
    
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"ListViewController.viewDidLoad Entered");
    [super viewDidLoad];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;

    NSLog(@"ListViewController.viewDidLoad Exited");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ListViewController.didSelectRowAtIndexPath Enteredd");
    if (_selectPersonTarget != nil) {
        [_selectPersonTarget performSelector:_selectPersonAction];
        [_table deselectRowAtIndexPath:indexPath animated:0];
    }
    NSLog(@"ListViewController.didSelectRowAtIndexPath Exited");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ListViewController.cellForRowAtIndexPath Entered");
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setSelectedBackgroundView:_cellBackgroundSelected];
    }
    
    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    cell.textLabel.font = _tableFont;
    cell.imageView.image = [UIImage imageNamed:@"user_add"];

    NSLog(@"ListViewController.cellForRowAtIndexPath Exited");

    return cell;
}


@end
