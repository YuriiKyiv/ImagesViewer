//
//  TYVImagesLibraryItem.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVImagesLibraryItem.h"

@interface TYVImagesLibraryItem ()

@end

@implementation TYVImagesLibraryItem

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

#pragma mark - NSCollectionViewElement

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.contentImageView.image = nil;
}

#pragma mark - Public

- (void)fillWithModel:(TYVImageModel *)model {
    self.contentImageView.image = model.image;
}

@end
