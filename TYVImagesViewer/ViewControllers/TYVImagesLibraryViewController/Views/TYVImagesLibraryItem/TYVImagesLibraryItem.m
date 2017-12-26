//
//  TYVImagesLibraryItem.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVImagesLibraryItem.h"
#import "TYVMacro.h"
#import "TYVImageModel.h"

@interface TYVImagesLibraryItem ()
@property (nonatomic, strong) TYVImageModel *model;

@end

@implementation TYVImagesLibraryItem

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Public

- (void)fillWithModel:(TYVImageModel *)model {
    self.model = model;
    TYVWeakify(self);
    TYVImageModelToken oldToken = model.token;
    [model getImageWithBlock:^(NSImage *image, TYVImageModelToken token) {
        TYVStrongify(self);
        if ([oldToken isEqualToString:token] || token == nil) {
            self.contentImageView.image = image;
        }
    }];
}

#pragma mark - Actions

- (void)mouseUp:(NSEvent *)event {
    if (event.clickCount == 2 && [self.observer respondsToSelector:@selector(doDoubleClick:)]) {
        [self.observer doDoubleClick:self.model];
    }
}

#pragma mark - NSCollectionViewElement

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.model = nil;
    self.contentImageView.image = nil;
}

@end
