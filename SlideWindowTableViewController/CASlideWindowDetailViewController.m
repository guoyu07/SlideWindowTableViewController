//
//  CASlideOpenDetailViewController.m
//  Demo
//
//  Created by Xiao on 3/23/2014.
//  Copyright (c) 2014 Xiao. All rights reserved.
//

#import "CASlideWindowDetailViewController.h"

@interface CASlideWindowDetailViewController ()

@end

@implementation CASlideWindowDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss{
    [self.delegate dismissDetailView];
}

@end
