//
//  TYVDetailImageView.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVDetailImageView.h"
#import "TYVImageModel.h"
#import "TYVMacro.h"


@implementation TYVDetailImageView

#pragma mark - Initialization and Deallocation

- (void)dealloc
{
    self.seletedImageModel = nil;
}

#pragma mark - Accesssors

- (void)setSeletedImageModel:(TYVImageModel *)seletedImageModel {
    if (_seletedImageModel != seletedImageModel) {
        _seletedImageModel = seletedImageModel;
        [self fillWithModel:seletedImageModel];
    }
}

#pragma mark - First responder

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)becomeFirstResponder {
    return YES;
}

- (BOOL)resignFirstResponder {
    return YES;
}

- (void)keyUp:(NSEvent *)event {
    if (event.keyCode == 53) {
        [self.delegate didPressOnEsc:nil];
    } else if (event.modifierFlags & NSUpArrowFunctionKey) {
        TYVImageModel *model = [self.dataSource nextImageModelForModel:self.seletedImageModel];
        [self fillWithModel:model];
    } else if (event.modifierFlags & NSDownArrowFunctionKey) {
        TYVImageModel *model = [self.dataSource previusImageModelForModel:self.seletedImageModel];
        [self fillWithModel:model];
    } else {
        [super keyUp:event];
    }
}

#pragma mark - Actions

- (IBAction)onUp:(NSButton *)sender {
    TYVImageModel *model = [self.dataSource nextImageModelForModel:self.seletedImageModel];
    [self fillWithModel:model];
}

- (IBAction)onDown:(NSButton *)sender {
    TYVImageModel *model = [self.dataSource previusImageModelForModel:self.seletedImageModel];
    [self fillWithModel:model];
}

- (IBAction)onBlur:(NSButton *)sender {
    if ([self.delegate respondsToSelector:@selector(didPressOnBlur:)]) {
        [self.delegate didPressOnBlur:self.seletedImageModel];
    }
}

#pragma mark - Private

- (void)fillWithModel:(TYVImageModel *)model {
    TYVWeakify(self);
    [model getImageWithBlock:^(NSImage *image, TYVImageModelToken token) {
        TYVStrongify(self);
        self.contentImageView.image = image;
    }];
}


@end
