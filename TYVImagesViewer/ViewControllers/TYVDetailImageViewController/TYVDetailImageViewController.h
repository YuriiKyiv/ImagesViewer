//
//  TYVDetailImageViewController.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TYVDetailImageViewController;
@class TYVDetailImageViewModel;

@protocol TYVDetailImageViewControllerDelegate
- (void)didPressOnEsc:(TYVDetailImageViewController *)controller;

@end

@interface TYVDetailImageViewController : NSViewController
@property (nonatomic, strong) TYVDetailImageViewModel *model;

@property (nonatomic, weak) id<TYVDetailImageViewControllerDelegate> delegate;

@end
