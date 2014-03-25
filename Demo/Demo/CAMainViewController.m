//
//  CAMainViewController.m
//  Demo
//
//  Created by Xiao Ma on 2014-03-24.
//  Copyright (c) 2014 Xiao. All rights reserved.
//

#import "CAMainViewController.h"
#import "CADetailViewController.h"

@interface CAMainViewController () <CASlideWindowTableViewDataSource>

@end

@implementation CAMainViewController

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
    self.slideDataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"test";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


#pragma mark SlideWindowTableViewController data source
- (UIViewController *)tableView:(UITableView *)tableView viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *detailVC = [CADetailViewController new];
    
    // Use [self addOpenAnimations: closeAnimations: forIndexPath:]
    // for adding extra animations. Example as follow:
    /*
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    CGPoint origin = [self.tableView convertPoint:CGPointZero fromView:cell.textLabel];
    
    UILabel *title = cell.textLabel;
    
    CGRect frame = cell.textLabel.frame;
    frame.origin = origin;
    
    __block typeof(self) weakSelf = self;
    
    [self addOpenAnimations:^{
        UILabel *fakelabel = [[UILabel alloc] initWithFrame:frame];
        fakelabel.text = title.text;
        fakelabel.font = cell.textLabel.font;
        fakelabel.backgroundColor = title.backgroundColor;
        title.alpha = 0;
        [weakSelf.tableView addSubview:fakelabel];
        
        ((CADetailViewController *)detailVC).titleLabel.alpha = 0;
        CGRect targetFrame = ((CADetailViewController *)detailVC).titleLabel.frame;
        
        [UIView animateWithDuration:ANIMATION_DURATION * 2 animations:^{
            fakelabel.frame = targetFrame;
        } completion:^(BOOL finished) {
            [fakelabel removeFromSuperview];
            ((CADetailViewController *)detailVC).titleLabel.alpha = 1;
        }];
        
    } closeAnimations:^{
        UILabel *title = ((CADetailViewController *)detailVC).titleLabel;
        CGRect initFrame = title.frame;

        UILabel *fakelabel = [[UILabel alloc] initWithFrame:initFrame];
        fakelabel.text = title.text;
        fakelabel.font = cell.textLabel.font;
        title.alpha = 0;
        [weakSelf.tableView addSubview:fakelabel];
        
        [UIView animateWithDuration:ANIMATION_DURATION * 2 animations:^{
            fakelabel.frame = frame;
        } completion:^(BOOL finished) {
            [fakelabel removeFromSuperview];
        }];
        
    } forIndexPath:indexPath];
    */
    
    return detailVC;
}

@end
