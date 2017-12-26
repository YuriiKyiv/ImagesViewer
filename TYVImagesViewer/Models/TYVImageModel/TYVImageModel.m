//
//  TYVImageModel.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TYVImageModel.h"

@interface TYVImageModel ()
@property (nonatomic, strong)   NSImage *image;
@property (nonatomic, strong)   NSURL   *url;

@end

@implementation TYVImageModel

#pragma mark - Class

+ (instancetype)modelWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark - Initialization and Deallocation

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark - Public

- (void)getImageWithBlock:(TYVImageModelCompletion)completinBlock {
    if (_image != nil) {
        completinBlock(_image);
    } else {
        NSURL *url = self.url;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            NSImage *image = [[NSImage alloc] initWithContentsOfURL:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                completinBlock(image);
            });
        });
    }
}

@end
