/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>

#import "UIExtendedViewController.h"

@interface TrendsViewController : UIExtendedViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong) UILabel* contextLabel;
@property (strong) UILabel* graphTitle;
@property (strong) UIButton* backButton;
@property (strong) UIButton* menuButton;
@property (strong) UINavigationBar* navigationBar;
@property (nonatomic, assign) id changeViewTarget;
@property (nonatomic) SEL bodySelectionAction;
@property (nonatomic) SEL tabularSelectionAction;
@property (nonatomic) SEL graphSelectionAction;

@end
