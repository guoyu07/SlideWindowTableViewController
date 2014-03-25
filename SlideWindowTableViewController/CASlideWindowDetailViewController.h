//
//  CASlideOpenDetailViewController.h
//  Demo
//
//  Created by Xiao on 3/23/2014.
//  Copyright (c) 2014 Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CASlideWindowTableViewControllerProtocols.h"

@interface CASlideWindowDetailViewController : UIViewController

@property (nonatomic, weak) id<CASlideWindowDetailViewControllerDelegate> delegate;

- (void)dismiss;

@end
