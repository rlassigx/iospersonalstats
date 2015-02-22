/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>

#import "HeadView.h"

@interface EntryMenuController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (strong) UITapGestureRecognizer* tapGesture;
@property (strong) UIPanGestureRecognizer* panGesture;
@property (strong) HeadView* headView;
@property (strong) UIFont* tableFont;
@property (strong) NSArray *tableData;
@property (strong) UITableView* tableView;
@property (strong) UIColor* unselectedColor;
@property (strong) UIColor* selectedColor;
@property (strong) UIView* selectedColorView;
@property (strong) UIImageView* screenShotImageView;
@property (strong) UIImage* screenShotImage;
@property (nonatomic, assign) id selectTarget;
@property (nonatomic) SEL selectAction;
@property (nonatomic) SEL updatePhotoAction;
@property (nonatomic) SEL figureAction;
@property (nonatomic) SEL profileAction;
@property (nonatomic) SEL trendsAction;

-(void)slideThenHide;

-(void) adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;

@end
