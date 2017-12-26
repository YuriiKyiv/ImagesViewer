//
//  TYVImagesLibraryModel.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYVImageModel;

@interface TYVImagesLibraryModel : NSObject
@property (readonly) NSArray<TYVImageModel *>   *images;
@property (readonly) NSUInteger   count;

- (void)addImageWithURL:(NSURL *)url;
- (void)insertImageWithURL:(NSURL *)url atIndex:(NSUInteger)index;
- (void)insertImageModel:(TYVImageModel *)model atIndex:(NSUInteger)index;
- (TYVImageModel *)imageAtIndex:(NSUInteger)index;

@end
