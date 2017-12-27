//
//  TYVDetailImageViewController.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVDetailImageViewController.h"
#import "TYVDetailImageView.h"
#import "TYVDetailImageViewModel.h"

#import "TYVMacro.h"

TYVViewControllerProperty(TYVDetailImageViewController, rootView, TYVDetailImageView)

@interface TYVDetailImageViewController () <TYVDetailImageViewDelegate, TYVDetailImageViewDataSource>

@end

@implementation TYVDetailImageViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configure];
}

- (void)viewWillAppear {
    [super viewWillAppear];
    
    self.rootView.seletedImageModel = self.model.selectedModel;
}

#pragma mark - Private

- (void)configure {
    self.rootView.delegate = self;
    self.rootView.dataSource = self;
}

#pragma mark - TYVDetailImageViewDelegate

- (void)didPressOnEsc:(TYVDetailImageView *)view {
    [self.delegate didPressOnEsc:self];
}

#pragma mark - TYVDetailImageViewDataSource

- (TYVImageModel *)nextImageModelForModel:(TYVImageModel *)model {
    return self.model.nextModel;
}

- (TYVImageModel *)previusImageModelForModel:(TYVImageModel *)model {
    return self.model.prevModel;
}

@end
