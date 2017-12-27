//
//  TYVDetailImageViewModel.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYVImagesLibraryModel;
@class TYVImageModel;

@interface TYVDetailImageViewModel : NSObject
@property (nonatomic, strong) TYVImageModel *selectedModel;

- (id)initWithLibraryModel:(TYVImagesLibraryModel *)libraryModel
             selectedModel:(TYVImageModel *)selecedModel;

- (TYVImageModel *)nextModel;
- (TYVImageModel *)prevModel;

@end
