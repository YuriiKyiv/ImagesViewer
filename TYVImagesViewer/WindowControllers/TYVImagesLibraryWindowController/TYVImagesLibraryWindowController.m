//
//  TYVImagesLibraryWindowController.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVImagesLibraryWindowController.h"
#import "TYVImagesLibraryViewController.h"
#import "TYVImageModel.h"
#import "TYVImagesLibraryModel.h"
#import "TYVDetailImageViewController.h"

@interface TYVImagesLibraryWindowController () <TYVImagesLibraryViewControllerDelegate, TYVDetailImageViewControllerDelegate>
@property (nonatomic, strong) TYVDetailImageViewController      *detailController;
@property (nonatomic, strong) TYVImagesLibraryViewController    *libraryController;
@end

@implementation TYVImagesLibraryWindowController

#pragma mark - Window Lifecycle

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [self configure];
}

#pragma mark - Accessors

- (TYVDetailImageViewController *)detailController {
    if (_detailController == nil) {
        NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
        _detailController = [sb instantiateControllerWithIdentifier:NSStringFromClass(TYVDetailImageViewController.class)];
    }
    
    return _detailController;
}

#pragma mark - Private

- (void)configure {
    TYVImagesLibraryViewController *controller = (TYVImagesLibraryViewController *)self.contentViewController;
    self.libraryController = controller;
    controller.delegate = self;
    TYVImagesLibraryModel *model = [TYVImagesLibraryModel new];
    
    for (int i = 0; i < 50; i++) {
        TYVImageModel *image = [TYVImageModel modelWithImageName:@"sample"];
        [model insertImageModel:image atIndex:i];
    }
    
    controller.model = model;
}

#pragma mark - TYVImagesLibraryViewControllerDelegate

- (void)showDetailImageWithModel:(TYVImageModel *)model {
    TYVDetailImageViewController *detailController = self.detailController;
    detailController.delegate = self;
    detailController.view.frame = self.contentViewController.view.frame;
    self.contentViewController = detailController;
}

#pragma mark - TYVDetailImageViewControllerDelegate

- (void)didPressOnEsc:(TYVDetailImageViewController *)controller {
    self.contentViewController = self.libraryController;
}

@end
