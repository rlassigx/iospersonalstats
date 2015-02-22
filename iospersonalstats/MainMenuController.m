/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "MainMenuController.h"

#import <QuartzCore/QuartzCore.h>

@implementation MainMenuController

- (id)init
{
    NSLog(@"MainMenuController.init Entered");

    self = [super init];

    _tableData = [[NSArray alloc] initWithObjects:@"List", @"Profile", @"History", @"Trends", @"Figure", @"Share",  @"Print", @"Settings", @"Backup", @"Restore", nil];
    _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width * 3 / 4, self.view.frame.size.height)) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;

    _unselectedColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1];
    _selectedColor = _unselectedColor;
    _selectedColorView = [[UIView alloc] init];
    [_selectedColorView setBackgroundColor:_selectedColor];

    _tableFont = [UIFont systemFontOfSize:16];

    _tableView.separatorColor = _unselectedColor;
    _tableView.backgroundColor = _unselectedColor;
    _screenShotImageView = [[UIImageView alloc] init];
    _screenShotImageView.userInteractionEnabled = TRUE;
    [self.view addSubview:_tableView];
    [self.view addSubview:_screenShotImageView];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapScreenShot:)];
    [_screenShotImageView addGestureRecognizer:_tapGesture];
    
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
    [_panGesture setMaximumNumberOfTouches:2];
    [_panGesture setDelegate:self];
    [_screenShotImageView addGestureRecognizer:_panGesture];

    NSLog(@"MainMenuController.init Exited");

    return self;
}

- (void)viewDidLoad
{
    NSLog(@"MainMenuController.viewDidLoad Entered");
    [super viewDidLoad];
    NSLog(@"MainMenuController.viewDidLoad Exited");
}

- (void)viewDidUnload
{
    NSLog(@"MainMenuController.viewDidUnload Entered");
    [super viewDidUnload];
    NSLog(@"MainMenuController.viewDidUnload Exited");
}

- (void)singleTapScreenShot:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"MainMenuController.singleTapScreenShot Entered");
    // on a single tap of the screenshot, assume the user is done viewing the menu
    // and call the slideThenHide function
    [self slideThenHide];
    NSLog(@"MainMenuController.singleTapScreenShot Entered");
}

-(void)panGestureMoveAround:(UIPanGestureRecognizer *)gesture;
{
//    NSLog(@"MainMenuController.panGestureMoveAround Entered");
    UIView *piece = [gesture view];
    [self adjustAnchorPointForGestureRecognizer:gesture];
    
    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [gesture translationInView:[piece superview]];
        
        // I edited this line so that the image view cannont move vertically
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y)];
        [gesture setTranslation:CGPointZero inView:[piece superview]];
    }
    else if ([gesture state] == UIGestureRecognizerStateEnded)
        [self slideThenHide];
//    NSLog(@"MainMenuController.panGestureMoveAround Exited");
}

- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
//    NSLog(@"MainMenuController.adjustAnchorPointForGestureRecognizer Entered");
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
//    NSLog(@"MainMenuController.adjustAnchorPointForGestureRecognizer Exited");
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"MainMenuController.viewWillAppear Entered");

    [super viewWillAppear:animated];
    
    [_screenShotImageView setImage:_screenShotImage];
    [_screenShotImageView setFrame:CGRectMake(0, 0, _screenShotImage.size.width, _screenShotImage.size.height)];
    
    [_screenShotImageView addGestureRecognizer:_tapGesture];
    [_screenShotImageView addGestureRecognizer:_panGesture];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_screenShotImageView setFrame:CGRectMake(self.view.frame.size.width * 3 / 4, 0, _screenShotImage.size.width, _screenShotImage.size.height)];
    }
                     completion:^(BOOL finished){  }];
    
    NSLog(@"MainMenuController.viewWillAppear Exited");
}

-(void) slideThenHide
{
    NSLog(@"MainMenuController.slideThenHide Entered");

    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_screenShotImageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
                     completion:^(BOOL finished){ [_selectTarget performSelector:_selectAction]; }];
    
    NSLog(@"MainMenuController.slideThenHide Exited");
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"MainMenuController.didReceiveMemoryWarning Entered");
    [super didReceiveMemoryWarning];
    NSLog(@"MainMenuController.didReceiveMemoryWarning Exited");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"MainMenuController.didSelectRowAtIndexPath Entered");

    if (_selectTarget != nil && _selectAction != nil) {
        if (indexPath.item == 0) {
            NSLog(@"All Entries");
            _selectAction = _allEntriesAction;
        } else if (indexPath.item == 1) {
            NSLog(@"Profile");
            _selectAction = _profileAction;
        } else if (indexPath.item == 2) {
            NSLog(@"History");
            _selectAction = _historyAction;
        } else if (indexPath.item == 3) {
            NSLog(@"Trends");
            _selectAction = _trendsAction;
        } else if (indexPath.item == 4) {
            NSLog(@"Figure");
            _selectAction = _figureAction;
        } else if (indexPath.item == 5) {
            NSLog(@"Share");
            _selectAction = _shareAction;
        } else if (indexPath.item == 6) {
            NSLog(@"Print");
            _selectAction = _printAction;
        } else if (indexPath.item == 7) {
            NSLog(@"Settings");
            _selectAction = _settingsAction;
        } else if (indexPath.item == 8) {
            NSLog(@"Backup");
            _selectAction = _backupAction;
        } else if (indexPath.item == 9) {
            NSLog(@"Recover");
            _selectAction = _restoreAction;
        } else {
            NSLog(@"Error: Unknown menu selection");
            _selectAction = _aboutAction;
        }
        [self slideThenHide];
        [self.tableView deselectRowAtIndexPath:indexPath animated:0];
    }
    
    NSLog(@"MainMenuController.didSelectRowAtIndexPath Exited");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"MainMenuController.numberOfRowsInSection Entered");
    NSLog(@"MainMenuController.numberOfRowsInSection Exited");
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"MainMenuController.cellForRowAtIndexPath Entered");
    
    static NSString *simpleTableIdentifier = @"SimpleTableItemY";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        [cell setSelectedBackgroundView:_selectedColorView];
    }

    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    cell.textLabel.font = _tableFont;
    if (indexPath.item == 0) {
        cell.textLabel.textColor = [UIColor whiteColor];
    } else {
        cell.textLabel.textColor = [UIColor lightGrayColor];
    }
    
    NSLog(@"MainMenuController.cellForRowAtIndexPath Exited");
    
    return cell;
}

@end
