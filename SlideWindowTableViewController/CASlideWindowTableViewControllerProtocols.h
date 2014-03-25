//
//  CASlideWindowTableViewControllerProtocols.h
//  Demo
//
//  Created by Xiao on 3/23/2014.
//  Copyright (c) 2014 Xiao. All rights reserved.
//

#ifndef Demo_CASlideWindowTableViewControllerProtocols_h
#define Demo_CASlideWindowTableViewControllerProtocols_h

@protocol CASlideWindowDetailViewControllerDelegate <NSObject>

- (void)dismissDetailView;

@end

@protocol CASlideOpenTableDetailViewControllerDataSource <NSObject>

- (UILabel *)textLable;

@end


#endif
