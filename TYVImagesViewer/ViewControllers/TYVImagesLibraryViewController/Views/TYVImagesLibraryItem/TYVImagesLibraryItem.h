//
//  TYVImagesLibraryItem.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TYVImageModel.h"

@interface TYVImagesLibraryItem : NSCollectionViewItem

@property (weak) IBOutlet NSImageView *contentImageView;

- (void)fillWithModel:(TYVImageModel *)model;

@end
