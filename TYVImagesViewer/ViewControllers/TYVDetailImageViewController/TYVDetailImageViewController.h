//
//  TYVDetailImageViewController.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TYVDetailImageViewController;

@protocol TYVDetailImageViewControllerDelegate
- (void)didPressOnEsc:(TYVDetailImageViewController *)controller;

@end

@interface TYVDetailImageViewController : NSViewController
@property (nonatomic, weak) id<TYVDetailImageViewControllerDelegate> delegate;

@end
