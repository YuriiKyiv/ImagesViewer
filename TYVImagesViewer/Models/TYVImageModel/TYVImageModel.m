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

#pragma mark - Accessors

- (NSImage *)image {
    return [NSImage imageNamed:@"sample"];
}

@end
