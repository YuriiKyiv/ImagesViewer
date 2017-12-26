//
//  TYVImagesLibraryViewController.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 25.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TYVImagesLibraryModel;

@interface TYVImagesLibraryViewController : NSViewController
@property (nonatomic, strong)   TYVImagesLibraryModel *model;

@end
