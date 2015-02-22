/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "HistoryViewController.h"

#import "MenuButton.h"
#import "ProfileButton.h"
#import "AddPersonButton.h"

@implementation HistoryViewController

- (id)init
{
    NSLog(@"HistoryViewController.init Entered");

    self = [super init];
    _backingView = [[UIView alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44))];
    _backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [_backingView setBackgroundColor:_backgroundColor];
    [self.view addSubview:_backingView];
    
    _backButton = [[ProfileButton alloc] initWithFrame:CGRectMake(5, 5, 40, 30)];
    _menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 45, 5, 40, 30)];

    UIView *topView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [topView setBackgroundColor:_backgroundColor];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor clearColor];
    _contextLabel.text = @"History";
    _contextLabel.textColor = [UIColor darkGrayColor];
    _contextLabel.textAlignment = NSTextAlignmentCenter;

    _cellBackground = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [_cellBackground setBackgroundColor:[UIColor whiteColor]];
    
    _cellBackgroundSelected = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 44))];
    [_cellBackgroundSelected setBackgroundColor:[UIColor lightGrayColor]];

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
    
    _tableData = [[NSArray alloc] initWithObjects: @"02 Feb 2013", @"02 Jan 2013", @"15 June 2012", @"25 Feb 2012", nil];
    _table = [[UITableView alloc] initWithFrame:(CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)) style:UITableViewStylePlain];
    [_table setScrollEnabled:false];
    UIView *backview = [[UIView alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44))];
    _backgroundColor = [[UIColor alloc]initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [backview setBackgroundColor:[UIColor whiteColor]];
    [_table setBackgroundView:backview];
    _tableFont = [UIFont systemFontOfSize:14];
    _table.dataSource = self;
    _table.delegate = self;

    [_table setSeparatorColor:[UIColor whiteColor]];
    [_table setBackgroundColor:[UIColor whiteColor]];

    _contextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 44, self.view.frame.size.width, 44))];
    _contextLabel.backgroundColor = [UIColor whiteColor];
    _contextLabel.text = @"Waist";
    _contextLabel.textAlignment = NSTextAlignmentCenter;

    UIButton* addPersonButton = [[AddPersonButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 40, 51, 40, 30)];
    
    [self.view addSubview:topView];

    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [scrollView setScrollEnabled:true];
    [scrollView setBackgroundColor:_backgroundColor];
    [scrollView addSubview:_table];
    [scrollView addSubview:nameView];
    [scrollView addSubview:_contextLabel];
    [scrollView addSubview:addPersonButton];
    [self.view addSubview:scrollView];
    
    NSLog(@"HistoryViewController.init Exited");

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
    NSLog(@"HistoryViewController.didReceiveMemoryWarning Entered");
    [super didReceiveMemoryWarning];
    NSLog(@"HistoryViewController.didReceiveMemoryWarning Exited");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ListViewController.didSelectRowAtIndexPath Enteredd");
//    if (selectPersonTarget != nil) {
  //      [selectPersonTarget performSelector:selectPersonAction];
    //    [table deselectRowAtIndexPath:indexPath animated:0];
   // }
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setSelectedBackgroundView:_cellBackgroundSelected];
    }

    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    cell.textLabel.font = _tableFont;
    cell.detailTextLabel.text = @"64 cm";
    cell.detailTextLabel.font = _tableFont;
    cell.imageView.image = [UIImage imageNamed:@"user_add"];
    
    NSLog(@"ListViewController.cellForRowAtIndexPath Exited");
    
    return cell;
}

@end
