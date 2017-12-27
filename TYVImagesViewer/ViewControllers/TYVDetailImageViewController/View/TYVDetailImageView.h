//
//  TYVDetailImageView.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TYVImageModel;
@class TYVDetailImageView;

@protocol TYVDetailImageViewDataSource
- (TYVImageModel *)nextImageModelForModel:(TYVImageModel *)model;
- (TYVImageModel *)previusImageModelForModel:(TYVImageModel *)model;

@end

@protocol TYVDetailImageViewDelegate
- (void)didPressOnEsc:(TYVDetailImageView *)view;

@optional
- (void)didPressOnBlur:(TYVImageModel *)mdel;

@end

@interface TYVDetailImageView : NSView
@property (nonatomic, weak) id<TYVDetailImageViewDataSource>    dataSource;
@property (nonatomic, weak) id<TYVDetailImageViewDelegate>      delegate;

@end
