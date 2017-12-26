//
//  TYVImagesLibraryItem.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVImagesLibraryItem.h"
#import "TYVMacro.h"

@interface TYVImagesLibraryItem ()

@end

@implementation TYVImagesLibraryItem

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Public

- (void)fillWithModel:(TYVImageModel *)model {
    TYVWeakify(self);
    TYVImageModelToken oldToken = model.token;
    [model getImageWithBlock:^(NSImage *image, TYVImageModelToken token) {
        TYVStrongify(self);
        if ([oldToken isEqualToString:token]) {
            self.contentImageView.image = image;
        }
    }];
}

#pragma mark - NSCollectionViewElement

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.contentImageView.image = nil;
}

@end
