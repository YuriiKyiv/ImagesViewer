//
//  TYVDetailImageViewController.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVDetailImageViewController.h"
#import "TYVDetailImageView.h"
#import "TYVMacro.h"

TYVViewControllerProperty(TYVDetailImageViewController, rootView, TYVDetailImageView)

@interface TYVDetailImageViewController () <TYVDetailImageViewDelegate>

@end

@implementation TYVDetailImageViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configure];
}

#pragma mark - Private

- (void)configure {
    self.rootView.delegate = self;
}

#pragma mark - TYVDetailImageViewDelegate

- (void)didPressOnEsc:(TYVDetailImageView *)view {
    [self.delegate didPressOnEsc:self];
}

@end
