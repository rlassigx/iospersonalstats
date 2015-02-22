/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "ProfileViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "MenuButton.h"
#import "ProfileButton.h"

@implementation ProfileViewController

- (id)init
{
    NSLog(@"TabularViewController.init Entered");

    self = [super init];

    _peopleMenuTableData = [[NSArray alloc] initWithObjects: @"Arm", @"Chest", @"Head", @"Height", @"Inside Leg", @"Length", @"Neck", @"Ring Size", @"Shoe Size", @"Waist", @"Weight", nil];

    UIView *topView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    UIColor* backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.view setBackgroundColor:backgroundColor];
    [topView setBackgroundColor:backgroundColor];
    [self.view addSubview:topView];
    
    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44))];
    [view setBackgroundColor:[UIColor whiteColor]];

    _table = [[UITableView alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height * 2)) style:UITableViewStylePlain];
    [_table setBackgroundView:view];
    [_table setSeparatorColor:[UIColor whiteColor]];
    [_table setBackgroundColor:[UIColor whiteColor]];

    _table.dataSource = self;
    _table.delegate = self;
    [_table setBackgroundColor:[UIColor whiteColor]];
    [_table setScrollEnabled:false];
    [_table addSubview:_entryLabel];

    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [scrollView setScrollEnabled:true];
    [scrollView addSubview:_table];
    [self.view addSubview:scrollView];

    _cellBackgroundSelected = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [_cellBackgroundSelected setBackgroundColor:[UIColor lightGrayColor]];
    
    _menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 40 - 5, 5, 40, 30)];
    _backButton = [[ProfileButton alloc] initWithFrame:CGRectMake(5, 5, 40, 30)];
    
    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Profile";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;

    [topView addSubview:_contextLabel];
    [topView addSubview:_menuButton];
    [topView addSubview:_backButton];

    UIView *nameView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [nameView setBackgroundColor:[UIColor darkGrayColor]];
    
    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"Jane";
    _contextLabel.textColor = [UIColor whiteColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;
    [nameView addSubview:_contextLabel];
    [scrollView addSubview:nameView];

    _tableFont = [UIFont systemFontOfSize:14];
    _entryLabel.font = _tableFont;

    NSLog(@"TabularViewController.init Exited");

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"TabularViewController.didReceiveMemoryWarning Entered");
    [super didReceiveMemoryWarning];
    NSLog(@"TabularViewController.didReceiveMemoryWarning Exited");

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"TabularViewController.didSelectRowAtIndexPath Entered");
    if (_selectTarget != nil && _selectAction != nil) {
        [_selectTarget performSelector:_selectAction];
        [_table deselectRowAtIndexPath:indexPath animated:0];
    }
    NSLog(@"TabularViewController.didSelectRowAtIndexPath Exited");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"TabularViewController.numberOfRowsInSection Entered");
    NSLog(@"TabularViewController.numberOfRowsInSection Exited");
    if (section == 0) {
        return [_peopleMenuTableData count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"TabularViewController.cellForRowAtIndexPath Entered");
    
    static NSString *simpleTableIdentifier = @"SimpleTableItemY";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setSelectedBackgroundView:_cellBackgroundSelected];
    }

        cell.textLabel.text = [_peopleMenuTableData objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = @"--";

    cell.textLabel.font = _tableFont;
    cell.imageView.image = [UIImage imageNamed:@"user_add"];
    
    NSLog(@"TabularViewController.cellForRowAtIndexPath Exited");
    
    return cell;
}

@end
