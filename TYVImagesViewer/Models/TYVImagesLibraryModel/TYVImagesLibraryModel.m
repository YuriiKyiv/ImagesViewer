//
//  TYVImagesLibraryModel.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVImagesLibraryModel.h"
#import "TYVImageModel.h"

@interface TYVImagesLibraryModel ()
@property (nonatomic, strong)   NSMutableArray<TYVImageModel *> *models;

@end

@implementation TYVImagesLibraryModel
@dynamic images;
@dynamic count;

#pragma mark - Initialization and Deallocation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.models = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark - Accessors

- (NSArray<TYVImageModel *> *)images {
    return [self.models copy];
}

- (NSUInteger)count {
    return self.models.count;
}

#pragma mark - Public

- (void)addImageWithURL:(NSURL *)url {
    [self.models addObject:[TYVImageModel modelWithURL:url]];
}

- (void)insertImageWithURL:(NSURL *)url atIndex:(NSUInteger)index {
    [self insertImageModel:[TYVImageModel modelWithURL:url] atIndex:index];
}

- (void)insertImageModel:(TYVImageModel *)model atIndex:(NSUInteger)index {
    [self.models insertObject:model atIndex:index];
}

- (TYVImageModel *)imageAtIndex:(NSUInteger)index {
    return self.images[index];
}

@end
