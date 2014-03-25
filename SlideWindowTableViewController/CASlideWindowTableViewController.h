//
//  CASlideWindowTableViewController.h
//  Demo
//
//  Created by Xiao on 3/23/2014.
//  Copyright (c) 2014 Xiao. All rights reserved.
//

#define ANIMATION_DURATION 0.5

#import <UIKit/UIKit.h>

@protocol CASlideWindowTableViewDataSource <NSObject>

- (UIViewController *)tableView:tableView viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CASlideWindowTableViewController : UITableViewController

@property (nonatomic, weak) id<CASlideWindowTableViewDataSource> slideDataSource;

- (void)addOpenAnimations:(void (^)(void))openAnimations closeAnimations:(void (^)(void))closeAnimations forIndexPath:(NSIndexPath *)indexPath;

@end
