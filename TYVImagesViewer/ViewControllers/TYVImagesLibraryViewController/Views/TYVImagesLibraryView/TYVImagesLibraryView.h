//
//  TYVImagesLibraryView.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol TYVImagesLibraryViewDelegate
- (void)insertImagesWithURLs:(NSArray<NSURL *> *)urls atPoint:(CGPoint)point indexPath:(NSIndexPath *)indexPath;

@end

@interface TYVImagesLibraryView : NSView
@property (weak) IBOutlet NSCollectionView *contentCollectionView;

@property (nonatomic, weak) id<TYVImagesLibraryViewDelegate>    delegate;

- (void)configure;

@end



