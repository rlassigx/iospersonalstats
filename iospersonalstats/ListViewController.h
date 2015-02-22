/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>

#import "UIExtendedViewController.h"

@interface ListViewController : UIExtendedViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong) UIColor* backgroundColor;
@property (strong) UIView* backView;
@property (strong) UIView *topView;
@property (strong) UILabel* contextLabel;
@property (strong) UIView* cellBackground;
@property (strong) UIView* cellBackgroundSelected;
@property (strong) UIFont* tableFont;
@property (strong) NSArray *tableData;
@property (strong) UITableView *table;
@property (strong) UIButton* addPersonButton;
@property (strong) UIButton* menuButton;
@property (nonatomic) SEL selectPersonAction;
@property (nonatomic,assign) id selectPersonTarget;

@end
