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

@protocol TYVDetailImageViewDelegate <NSObject>
- (void)didPressOnEsc:(TYVDetailImageView *)view;

@optional
- (void)didPressOnBlur:(TYVImageModel *)model;

@end

@interface TYVDetailImageView : NSView
@property (weak) IBOutlet NSImageView *contentImageView;

@property (nonatomic, strong) TYVImageModel  *seletedImageModel;

@property (nonatomic, weak) id<TYVDetailImageViewDataSource>    dataSource;
@property (nonatomic, weak) id<TYVDetailImageViewDelegate>      delegate;

@end
