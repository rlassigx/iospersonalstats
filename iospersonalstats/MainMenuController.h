/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>

@interface MainMenuController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic) int activeSelection;
@property (strong) UIFont* tableFont;
@property (strong) NSArray *tableData;
@property (strong) UITableView* tableView;
@property (strong) UIColor* unselectedColor;
@property (strong) UIColor* selectedColor;
@property (strong) UIView* selectedColorView;
@property (strong) UIImageView* screenShotImageView;
@property (strong) UIImage* screenShotImage;
@property (strong) UITapGestureRecognizer* tapGesture;
@property (strong) UIPanGestureRecognizer* panGesture;
@property (nonatomic, assign) id selectTarget;
@property (nonatomic) SEL selectAction;
@property (nonatomic) SEL allEntriesAction;
@property (nonatomic) SEL figureAction;
@property (nonatomic) SEL profileAction;
@property (nonatomic) SEL trendsAction;
@property (nonatomic) SEL historyAction;
@property (nonatomic) SEL settingsAction;
@property (nonatomic) SEL printAction;
@property (nonatomic) SEL shareAction;
@property (nonatomic) SEL backupAction;
@property (nonatomic) SEL restoreAction;
@property (nonatomic) SEL aboutAction;

-(void) slideThenHide;

-(void) adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;

@end
