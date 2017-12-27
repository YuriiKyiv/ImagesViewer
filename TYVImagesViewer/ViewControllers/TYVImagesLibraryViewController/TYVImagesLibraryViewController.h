//
//  TYVImagesLibraryViewController.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 25.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TYVImagesLibraryModel;
@class TYVImageModel;

@protocol TYVImagesLibraryViewControllerDelegate
- (void)showDetailImageWithModel:(TYVImageModel *)model;

@end

@interface TYVImagesLibraryViewController : NSViewController
@property (nonatomic, strong)   TYVImagesLibraryModel *model;
@property (nonatomic, weak) id<TYVImagesLibraryViewControllerDelegate>  delegate;

@end
