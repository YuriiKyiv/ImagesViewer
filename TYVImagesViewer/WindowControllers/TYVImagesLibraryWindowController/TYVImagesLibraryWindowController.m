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

@interface TYVImagesLibraryWindowController ()

@end

@implementation TYVImagesLibraryWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    TYVImagesLibraryViewController *controller = (TYVImagesLibraryViewController *)self.contentViewController;
    TYVImagesLibraryModel *model = [TYVImagesLibraryModel new];

    for (int i = 0; i < 50; i++) {
        TYVImageModel *image = [TYVImageModel new];
        [model insertImageModel:image atIndex:i];
    }
    
    controller.model = model;
}

@end
