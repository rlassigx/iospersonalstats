/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
*/
#import <UIKit/UIKit.h>

#import "AddPersonViewController.h"
#import "MainMenuController.h"
#import "EntryMenuController.h"
#import "ListViewController.h"
#import "FigureViewController.h"
#import "ProfileViewController.h"
#import "TrendsViewController.h"
#import "historyViewController.h"
#import "SettingsViewController.h"
#import "PrintViewController.h"
#import "ShareViewController.h"
#import "BackupViewController.h"
#import "RestoreViewController.h"
#import "AboutViewController.h"
#import "ColorSet.h"

@interface AppDelegate : UIResponder <UITabBarDelegate>

@property (strong) ColorSet* colors;
@property (strong) ColorSet* constrastColors;
@property (strong) ColorSet* secondaryColors;
@property (strong) ColorSet* secondaryConstrastColors;
@property (strong) ColorSet* menuColors;
@property (strong) ColorSet* menuContrastColors;
@property (strong) ColorSet* secondaryMenuColors;
@property (strong) ColorSet* secondaryMenuContrastColors;
@property (strong) UIWindow* window;
@property (strong) UITabBarController* tabBarController;
@property (strong) AddPersonViewController* addPersonViewController;
@property (strong) ListViewController* listViewController;
@property (strong) FigureViewController* figureViewController;
@property (strong) HistoryViewController* historyViewController;
@property (strong) ProfileViewController* profileViewController;
@property (strong) TrendsViewController* trendsViewController;
@property (strong) SettingsViewController* settingsViewController;
@property (strong) PrintViewController* printViewController;
@property (strong) ShareViewController* shareViewController;
@property (strong) BackupViewController* backupViewController;
@property (strong) RestoreViewController* restoreViewController;
@property (strong) AboutViewController* aboutViewController;
@property (strong) MainMenuController* mainMenuController;
@property (strong) EntryMenuController* entryMenuController;

@end
