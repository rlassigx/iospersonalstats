/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>

#import "UIExtendedViewController.h"

@interface ProfileViewController : UIExtendedViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong) UILabel* contextLabel;
@property (strong) UITableView* table;
@property (strong) UIView* cellBackgroundSelected;
@property (strong) UILabel* entryLabel;
@property (strong) NSArray* peopleMenuTableData;
@property (strong) NSArray* peopleMenuTableData1;
@property (strong) NSArray* peopleMenuTableData2;
@property (strong) UIFont* tableFont;
@property (strong) UIButton* backButton;
@property (strong) UIButton* menuButton;
@property (strong) NSArray* tableData;
@property (nonatomic, assign) id changeViewTarget;
@property (nonatomic) SEL bodySelectionAction;
@property (nonatomic) SEL tabularSelectionAction;
@property (nonatomic) SEL graphSelectionAction;
@property (nonatomic) SEL selectAction;
@property (nonatomic, assign) id selectTarget;

@end
