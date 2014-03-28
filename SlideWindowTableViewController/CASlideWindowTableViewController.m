//
//  CASlideWindowTableViewController.m
//  Demo
//
//  Created by Xiao on 3/23/2014.
//  Copyright (c) 2014 Xiao. All rights reserved.
//

#import "CASlideWindowTableViewController.h"
#import "CASlideWindowDetailViewController.h"

@interface CASlideWindowTableViewController () <CASlideWindowDetailViewControllerDelegate>

@property (nonatomic, strong) NSMutableDictionary *animationDict;
@property (nonatomic, strong) UIViewController *detailVC;

@property CGFloat topDistance;
@property CGFloat bottomDistance;
@property (nonatomic, strong) NSIndexPath *selectedIndexPah;


@end

@implementation CASlideWindowTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _animationDict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailVC = [self.slideDataSource tableView:tableView viewControllerForRowAtIndexPath:indexPath];
    if ([self.detailVC isKindOfClass:[CASlideWindowDetailViewController class]]) {
        ((CASlideWindowDetailViewController *)self.detailVC).delegate = self;
    } else {
        NSLog(@"Detail view controller should be a subclass of CASlideWindowDetailViewController.");
        return;
    }
    
    self.selectedIndexPah = indexPath;
    
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [self addChildViewController:self.detailVC];
    [self.tableView addSubview:self.detailVC.view];
    [self.detailVC didMoveToParentViewController:self];
    self.detailVC.view.alpha = 0;
    
    // Additional animation
    if (self.animationDict[indexPath] && ((NSMutableDictionary *)self.animationDict[indexPath]).count == 2) {
        ((void (^)(void))self.animationDict[indexPath][0])();
    }
    
    NSArray *cells = self.tableView.visibleCells;
    self.tableView.scrollEnabled = NO;
    
    CGPoint origin = [self.tableView.window convertPoint:CGPointZero fromView:selectedCell];
    self.topDistance = origin.y;
    self.bottomDistance = CGRectGetHeight(self.tableView.window.frame) - self.topDistance;
    
    self.tableView.userInteractionEnabled = NO;
    for (UITableViewCell *cell in cells) {
        if ([self.tableView indexPathForCell:cell].row < indexPath.row) {
            [UIView animateWithDuration:1. animations:^{
                CGRect frame = cell.frame;
                frame.origin.y -= self.topDistance;
                cell.frame = frame;
            }];
        } else {
            [UIView animateWithDuration:ANIMATION_DURATION animations:^{
                CGRect frame = cell.frame;
                frame.origin.y += self.bottomDistance;
                cell.frame = frame;
            } completion:^(BOOL finished) {
                if (cell == selectedCell) {
                    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
                        self.detailVC.view.alpha = 1;
                    } completion:^(BOOL finished) {
                        self.tableView.userInteractionEnabled = YES;
                    }];
                }
            }];
        }
    }
}

- (void)dismissDetailView
{
    // Additional animation
    if (self.animationDict[self.selectedIndexPah] && ((NSMutableDictionary *)self.animationDict[self.selectedIndexPah]).count == 2) {
        ((void (^)(void))self.animationDict[self.selectedIndexPah][1])();
    }
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        self.detailVC.view.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        [self.detailVC.view removeFromSuperview];
        [self.detailVC removeFromParentViewController];
        
        NSArray *cells = self.tableView.visibleCells;
        self.tableView.userInteractionEnabled = NO;
        
        for (UITableViewCell *cell in cells) {
            if ([self.tableView indexPathForCell:cell].row < self.selectedIndexPah.row) {
                [UIView animateWithDuration:ANIMATION_DURATION animations:^{
                    CGRect frame = cell.frame;
                    frame.origin.y += self.topDistance;
                    cell.frame = frame;
                } completion:^(BOOL finished) {
                    
                }];
            } else {
                [UIView animateWithDuration:ANIMATION_DURATION animations:^{
                    CGRect frame = cell.frame;
                    frame.origin.y -= self.bottomDistance;
                    cell.frame = frame;
                } completion:^(BOOL finished) {
                    [self.tableView cellForRowAtIndexPath:self.selectedIndexPah].textLabel.alpha = 1;
                    self.tableView.scrollEnabled = YES;
                    self.tableView.userInteractionEnabled = YES;
                }];
            }
        }
        
    }];
}

- (void)addOpenAnimations:(void (^)(void))openAnimations closeAnimations:(void (^)(void))closeAnimations forIndexPath:(NSIndexPath *)indexPath
{
    self.animationDict[indexPath] = @[openAnimations, closeAnimations];
}

@end
