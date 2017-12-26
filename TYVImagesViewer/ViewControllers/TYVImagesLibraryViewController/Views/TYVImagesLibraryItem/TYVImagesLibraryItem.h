//
//  TYVImagesLibraryItem.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TYVImageModel;

@protocol TYVImagesLibraryItemObserver <NSObject>
@optional
- (void)doDoubleClick:(TYVImageModel *)model;

@end

@interface TYVImagesLibraryItem : NSCollectionViewItem
@property (weak) IBOutlet NSImageView *contentImageView;
@property (nonatomic, weak) id<TYVImagesLibraryItemObserver>    observer;

- (void)fillWithModel:(TYVImageModel *)model;

@end
