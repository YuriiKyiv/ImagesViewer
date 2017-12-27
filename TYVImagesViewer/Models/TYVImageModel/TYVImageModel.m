//
//  TYVImageModel.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TYVImageModel.h"
#import "TYVMacro.h"

@interface TYVImageModel ()
@property (nonatomic, strong)   NSImage *image;
@property (nonatomic, strong)   NSURL   *url;
@property (nonatomic, strong)   TYVImageModelCompletion completionBock;
@end

@implementation TYVImageModel
@dynamic token;

#pragma mark - Class

+ (instancetype)modelWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

+ (instancetype)modelWithImageName:(NSString *)imageName {
    return [[self alloc] initWithImageName:imageName];
}

#pragma mark - Initialization and Deallocation

- (void)dealloc {
    self.image = nil;
}

- (instancetype)initWithImageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        self.image = [NSImage imageNamed:imageName];
    }
    
    return self;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark - Accessors

- (void)setImage:(NSImage *)image {
    if (_image != image) {
        _image = image;
        if (self.completionBock) {
            self.completionBock(image, self.token);
        }
    }
}

- (TYVImageModelToken)token {
    return self.url.absoluteString;
}

#pragma mark - Public

- (void)getImageWithBlock:(TYVImageModelCompletion)completinBlock {
    self.completionBock = completinBlock;
    if (self.image != nil) {
        if (completinBlock) {
            completinBlock(self.image, self.token);
        }
    } else {
        NSURL *url = self.url;
        TYVWeakify(self);
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            NSImage *image = [[NSImage alloc] initWithContentsOfURL:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                TYVStrongify(self);
                self.image = image;
            });
        });
    }
}

@end
