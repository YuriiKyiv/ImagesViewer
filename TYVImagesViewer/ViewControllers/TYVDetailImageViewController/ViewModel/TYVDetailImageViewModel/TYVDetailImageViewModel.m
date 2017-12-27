//
//  TYVDetailImageViewModel.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVDetailImageViewModel.h"
#import "TYVImagesLibraryModel.h"
#import "TYVImageModel.h"

@interface TYVDetailImageViewModel ()
@property (nonatomic, strong) TYVImagesLibraryModel *libraryModel;

@end

@implementation TYVDetailImageViewModel

#pragma mark - Initialization and Deallocation

- (id)initWithLibraryModel:(TYVImagesLibraryModel *)libraryModel
             selectedModel:(TYVImageModel *)selecedModel
{
    self = [super init];
    if (self) {
        self.libraryModel = libraryModel;
        self.selectedModel = selecedModel;
    }
    
    return self;
}

#pragma mark - Public

- (TYVImageModel *)nextModel {
    TYVImagesLibraryModel *libraryModel = self.libraryModel;
    NSUInteger currentIndex = [libraryModel indexForModel:self.selectedModel];
    NSUInteger count = libraryModel.count;
    NSUInteger newIndex = currentIndex < count - 1 ? count - 1 : 0;
    TYVImageModel *model = [libraryModel imageAtIndex:newIndex];
    self.selectedModel = model;
    
    return model;
}

- (TYVImageModel *)prevModel {
    TYVImagesLibraryModel *libraryModel = self.libraryModel;
    NSUInteger currentIndex = [libraryModel indexForModel:self.selectedModel];
    NSUInteger newIndex = currentIndex == 0 ? libraryModel.count - 1 : currentIndex - 1;
    TYVImageModel *model = [libraryModel imageAtIndex:newIndex];
    self.selectedModel = model;
    
    return model;
}

@end
