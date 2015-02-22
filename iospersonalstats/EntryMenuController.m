/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import "EntryMenuController.h"

#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>

@implementation EntryMenuController

- (id)init
{
    NSLog(@"EntryMenuController.init Entered");

    self = [super init];
    _tableData = [[NSArray alloc] initWithObjects: @"Update photo", @"Shareable by Dropbox", @"Shareable by Facebook", @"Shareable by email", nil];
    _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(self.view.frame.size.width - (self.view.frame.size.width * 5 / 6), 240, self.view.frame.size.width * 5 / 6, self.view.frame.size.height)) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;

    _unselectedColor = [[UIColor alloc]initWithRed:20/255.0 green:20/255.0 blue:20/255.0 alpha:1];
    _selectedColor = _unselectedColor;
    _selectedColorView = [[UIView alloc] init];
    [_selectedColorView setBackgroundColor:_selectedColor];

    _tableFont = [UIFont systemFontOfSize:16];
    _tableView.separatorColor = _unselectedColor;
    _tableView.backgroundColor = _unselectedColor;
    _screenShotImageView = [[UIImageView alloc] init];

    _headView = [[HeadView alloc] initWithFrameAndDiameter:(CGRectMake(self.view.frame.size.width - (self.view.frame.size.width * 5 / 6), 0, self.view.frame.size.width * 5 / 6, 240)) diameter:150 color:[UIColor whiteColor]];

    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapScreenShot:)];
    [_screenShotImageView addGestureRecognizer:_tapGesture];
    
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
    [_panGesture setMaximumNumberOfTouches:2];
    [_panGesture setDelegate:self];
    [_screenShotImageView addGestureRecognizer:_panGesture];
    _screenShotImageView.userInteractionEnabled = TRUE;

    [self.view addSubview:_headView];
    [self.view addSubview:_tableView];
    [self.view addSubview:_screenShotImageView];
    
    NSLog(@"EntryMenuController.init Exited");

    return self;
}

- (void)viewDidLoad
{
    NSLog(@"EntryMenuController.viewDidLoad Entered");
    [super viewDidLoad];
    NSLog(@"EntryMenuController.viewDidLoad Exited");
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"EntryMenuController.viewWillAppear Entered");

    [super viewWillAppear:animated];
    
    [_screenShotImageView setImage:_screenShotImage];
    [_screenShotImageView setFrame:CGRectMake(0, 0, _screenShotImage.size.width, _screenShotImage.size.height)];
    
    [_screenShotImageView addGestureRecognizer:_tapGesture];
    [_screenShotImageView addGestureRecognizer:_panGesture];

    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_screenShotImageView setFrame:CGRectMake(-self.view.frame.size.width * 5 / 6, 0, _screenShotImage.size.width, _screenShotImage.size.height)];
    }
                     completion:^(BOOL finished){  }];
    
    NSLog(@"EntryMenuController.viewWillAppear Exited");
}

-(void) slideThenHide
{
    NSLog(@"EntryMenuController.slideThenHide Entered");

    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_screenShotImageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
                     completion:^(BOOL finished){ [_selectTarget performSelector:_selectAction]; }];
    
    NSLog(@"EntryMenuController.slideThenHide Exited");
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"EntryMenuController.didReceiveMemoryWarning Entered");
    [super didReceiveMemoryWarning];
    NSLog(@"EntryMenuController.didReceiveMemoryWarning Exited");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"EntryMenuController.didSelectRowAtIndexPath Entered");

    if (_selectTarget != nil && _selectAction != nil) {
        if (indexPath.item == 0) {
            NSLog(@"Jane");
            _selectAction = _updatePhotoAction;
            return;
        } else if (indexPath.item == 1) {
            NSLog(@"Update photo");
            if ([UIImagePickerController isSourceTypeAvailable:
                 UIImagePickerControllerSourceTypeCamera])
            {
                UIImagePickerController *imagePicker =
                [[UIImagePickerController alloc] init];
                imagePicker.delegate = self;
                imagePicker.sourceType =
                UIImagePickerControllerSourceTypeCamera;
                    imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                          (NSString *) kUTTypeImage,
                                          nil];
                imagePicker.allowsEditing = NO;
                [self presentModalViewController:imagePicker
                                        animated:YES];
            //    [imagePicker release];
             //   newMedia = YES;
            }
            return;
//            selectAction = updatePhotoAction;
        } else if (indexPath.item == 2) {
            NSLog(@"Shareable by Facebook");
            return;
      //      _selectAction = _updatePhotoAction;
        } else if (indexPath.item == 3) {
            NSLog(@"Shareable by Dropbox");
    //        _selectAction = _updatePhotoAction;
            return;
        } else if (indexPath.item == 4) {
            NSLog(@"Shareable by email");
      //      _selectAction = _updatePhotoAction;
            return;
        } else {
            NSLog(@"Error: Unknown selection");
        }
        [self slideThenHide];
        [self.tableView deselectRowAtIndexPath:indexPath animated:0];
    }

    NSLog(@"EntryMenuController.didSelectRowAtIndexPath Exited");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"EntryMenuController.numberOfRowsInSection Entered");
    NSLog(@"EntryMenuController.numberOfRowsInSection Exited");
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"EntryMenuController.cellForRowAtIndexPath Entered");

    static NSString *simpleTableIdentifier = @"SimpleTableItemY";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        [cell setSelectedBackgroundView:_selectedColorView];
    }

    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    cell.textLabel.font = _tableFont;
    cell.textLabel.textColor = [UIColor lightGrayColor];

    NSLog(@"EntryMenuController.cellForRowAtIndexPath Exited");

    return cell;
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

@end
