/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
*/
#import "AppDelegate.h"

#import <QuartzCore/QuartzCore.h>

#import "AddPersonViewController.h"
#import "ListViewController.h"
#import "FigureViewController.h"
#import "HistoryViewController.h"
#import "ProfileViewController.h"
#import "TrendsViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"AppDelegate.didFinishLaunchingWithOptions Entered");

    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.autoresizingMask = UIViewAutoresizingFlexibleHeight;

    _listViewController = [[ListViewController alloc] init];
    _figureViewController = [[FigureViewController alloc] init];
    _profileViewController = [[ProfileViewController alloc] init];
    _trendsViewController = [[TrendsViewController alloc] init];
    _historyViewController = [[HistoryViewController alloc] init];

    _window.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _window.autoresizesSubviews = UIViewAutoresizingFlexibleHeight;

    _settingsViewController = [[SettingsViewController alloc] init];
    _printViewController = [[PrintViewController alloc] init];
    _shareViewController = [[ShareViewController alloc] init];
    _backupViewController = [[BackupViewController alloc] init];
    _restoreViewController = [[RestoreViewController alloc] init];
    _aboutViewController = [[AboutViewController alloc] init];

    _addPersonViewController = [[AddPersonViewController alloc] init];
    _mainMenuController = [[MainMenuController alloc] init];
    _entryMenuController = [[EntryMenuController alloc] init];

    _listViewController.selectPersonAction = @selector(switchToProfileScreen);
    _listViewController.selectPersonTarget = self;

    [_listViewController.addPersonButton addTarget:self action:@selector(switchToAddPersonScreen) forControlEvents:UIControlEventTouchUpInside];
    [_listViewController.menuButton addTarget:self action:@selector(switchToMainMenu) forControlEvents:UIControlEventTouchUpInside];

    _mainMenuController.selectAction = @selector(switchToListScreen);
    _mainMenuController.allEntriesAction = @selector(switchToListScreen);
    _mainMenuController.figureAction = @selector(switchToFigureScreen);
    _mainMenuController.profileAction = @selector(switchToProfileScreen);
    _mainMenuController.trendsAction = @selector(switchToTrendsScreen);
    _mainMenuController.historyAction = @selector(switchToHistoryScreen);
    _mainMenuController.settingsAction = @selector(switchToSettingsScreen);
    _mainMenuController.printAction = @selector(switchToPrintScreen);
    _mainMenuController.shareAction = @selector(switchToShareScreen);
    _mainMenuController.backupAction = @selector(switchToBackupScreen);
    _mainMenuController.restoreAction = @selector(switchToRestoreScreen);
    _mainMenuController.aboutAction = @selector(switchToAboutScreen);

    _entryMenuController.selectAction = @selector(switchToProfileScreen);
    _entryMenuController.updatePhotoAction = @selector(switchToAboutScreen);

    _mainMenuController.selectTarget = self;
    [_addPersonViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_addPersonViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_settingsViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_backupViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_restoreViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_aboutViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_printViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_shareViewController.cancelButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];

    _entryMenuController.selectAction = @selector(switchToListScreen);
    _entryMenuController.selectTarget = self;
    
    [_addPersonViewController.doneButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_settingsViewController.doneButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_backupViewController.doneButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_restoreViewController.doneButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_aboutViewController.doneButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_printViewController.doneButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];
    [_shareViewController.doneButton addTarget:self action:@selector(switchToListScreen) forControlEvents:UIControlEventTouchUpInside];

    [_figureViewController.menuButton addTarget:self action:@selector(switchToEntryMenu) forControlEvents:UIControlEventTouchUpInside];
    [_trendsViewController.menuButton addTarget:self action:@selector(switchToEntryMenu) forControlEvents:UIControlEventTouchUpInside];
    [_historyViewController.menuButton addTarget:self action:@selector(switchToEntryMenu) forControlEvents:UIControlEventTouchUpInside];

    [_figureViewController.backButton addTarget:self action:@selector(switchToMainMenu) forControlEvents:UIControlEventTouchUpInside];
    [_historyViewController.backButton addTarget:self action:@selector(switchToMainMenu) forControlEvents:UIControlEventTouchUpInside];
    [_trendsViewController.backButton addTarget:self action:@selector(switchToMainMenu) forControlEvents:UIControlEventTouchUpInside];
    [_profileViewController.backButton addTarget:self action:@selector(switchToMainMenu) forControlEvents:UIControlEventTouchUpInside];

    _figureViewController.changeViewTarget = self;
    _historyViewController.changeViewTarget = self;
    _profileViewController.changeViewTarget = self;

    [_profileViewController.menuButton addTarget:self action:@selector(switchToEntryMenu) forControlEvents:UIControlEventTouchUpInside];
    _profileViewController.selectAction = @selector(switchToHistoryScreen);
    _profileViewController.selectTarget = self;

    _trendsViewController.changeViewTarget = self;

    _window.rootViewController = _listViewController;
    [_window makeKeyAndVisible];

    NSLog(@"AppDelegate.didFinishLaunchingWithOptions Exited");

    return YES;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"didSelectItem: %d", item.tag);
}

- (void)switchToViewController:(UIViewController*) viewController
{
    NSLog(@"AppDelegate.switchToViewController Entered");
    _window.rootViewController = viewController;
    NSLog(@"AppDelegate.switchToViewController Exited");
}

-(void)hideMainMenu
{
    NSLog(@"AppDelegate.hideSideMenu Exited");
    _window.rootViewController = _listViewController;
    NSLog(@"AppDelegate.hideSideMenu Exited");
}

- (void)switchToMainMenu
{
    NSLog(@"AppDelegate.switchToMainMenu Entered");
    UIExtendedViewController* ev = (UIExtendedViewController*) _window.rootViewController;
    _mainMenuController.screenShotImage = [ev snapshot];
    [_mainMenuController.screenShotImageView setImage:_mainMenuController.screenShotImage];
    _window.rootViewController = _mainMenuController;
    NSLog(@"AppDelegate.switchToMainMenu Exited");
}

- (void)switchToEntryMenu
{
    NSLog(@"AppDelegate.switchToEntryMenu Entered");
    UIExtendedViewController* ev = (UIExtendedViewController*) _window.rootViewController;
    _entryMenuController.screenShotImage = [ev snapshot];
    _window.rootViewController = _entryMenuController;
    NSLog(@"AppDelegate.switchToEntryMenu Exited");
}

- (void)switchToListScreen
{
    NSLog(@"AppDelegate.switchToListScreen Entered");
    [UIView transitionFromView:_window.rootViewController.view toView:_listViewController.view duration:0.35 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished){
        _window.rootViewController = _listViewController;
    }];
    NSLog(@"AppDelegate.switchToListScreen Exited");
}

- (void)switchToAddPersonScreen
{
    NSLog(@"AppDelegate.switchToAddPersonScreen Entered");
    [self switchToViewController:_addPersonViewController];
    NSLog(@"AppDelegate.switchToAddPersonScreen Exited");
}

- (void)switchToSettingsScreen
{
    NSLog(@"AppDelegate.switchToAddPersonScreen Entered");
    [self switchToViewController:_settingsViewController];
    NSLog(@"AppDelegate.switchToAddPersonScreen Exited");
}

- (void)switchToShareScreen
{
    NSLog(@"AppDelegate.switchToAddPersonScreen Entered");
    [self switchToViewController:_shareViewController];
    NSLog(@"AppDelegate.switchToAddPersonScreen Exited");
}

- (void)switchToPrintScreen
{
    NSLog(@"AppDelegate.switchToAddPersonScreen Entered");
    [self switchToViewController:_printViewController];
    NSLog(@"AppDelegate.switchToAddPersonScreen Exited");
}

- (void)switchToBackupScreen
{
    NSLog(@"AppDelegate.switchToAddPersonScreen Entered");
    [self switchToViewController:_backupViewController];
    NSLog(@"AppDelegate.switchToAddPersonScreen Exited");
}

- (void)switchToAboutScreen
{
    NSLog(@"AppDelegate.switchToAddPersonScreen Entered");
    [self switchToViewController:_aboutViewController];
    NSLog(@"AppDelegate.switchToAddPersonScreen Exited");
}

- (void)switchToRestoreScreen
{
    NSLog(@"AppDelegate.switchToAddPersonScreen Entered");
    [self switchToViewController:_restoreViewController];
    NSLog(@"AppDelegate.switchToAddPersonScreen Exited");
}

- (void)switchToFigureScreen
{
    NSLog(@"AppDelegate.switchToFigureScreen Entered");
    _window.rootViewController = _figureViewController;
    NSLog(@"AppDelegate.switchToFigureScreen Exited");
}

- (void)switchToProfileScreen
{
    NSLog(@"AppDelegate.switchToProfileScreen Entered");
    [UIView transitionFromView:_listViewController.view toView:_profileViewController.view duration:0.35 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished){
        _window.rootViewController = _profileViewController;
    }];
    NSLog(@"AppDelegate.switchToProfileScreen Exited");
}

- (void)switchToTrendsScreen
{
    NSLog(@"AppDelegate.switchToTrendsScreen Entered");
    _window.rootViewController = _trendsViewController;
    NSLog(@"AppDelegate.switchToTrendsScreen Exited");
}

- (void)switchToHistoryScreen
{
    NSLog(@"AppDelegate.switchToTrendsScreen Entered");
    _window.rootViewController = _historyViewController;
    NSLog(@"AppDelegate.switchToTrendsScreen Exited");
}

- (void)switchToUpdatePhotoScreen
{
    NSLog(@"AppDelegate.switchToTrendsScreen Entered");
    _window.rootViewController = _trendsViewController;
    NSLog(@"AppDelegate.switchToTrendsScreen Exited");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"AppDelegate.applicationWillResignActive Entered");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"AppDelegate.applicationWillResignActive Exited");

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"AppDelegate.applicationDidEnterBackground Entered");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"AppDelegate.applicationDidEnterBackground Exited");

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"AppDelegate.applicationWillEnterForeground Entered");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"AppDelegate.applicationWillEnterForeground Exited");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"AppDelegate.applicationDidBecomeActive Entered");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"AppDelegate.applicationDidBecomeActive Exited");

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"AppDelegate.applicationWillTerminate Entered");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"AppDelegate.applicationWillTerminate Exited");

}

@end
