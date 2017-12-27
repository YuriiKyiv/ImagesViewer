//
//  TYVImagesLibraryViewController.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 25.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVImagesLibraryViewController.h"
#import "TYVImagesLibraryItem.h"
#import "TYVImagesLibraryView.h"
#import "TYVImageModel.h"
#import "TYVImagesLibraryModel.h"
#import "TYVMacro.h"

TYVViewControllerProperty(TYVImagesLibraryViewController, rootView, TYVImagesLibraryView)

@interface TYVImagesLibraryViewController () <TYVImagesLibraryViewDelegate, NSCollectionViewDataSource, TYVImagesLibraryItemObserver>

@end

@implementation TYVImagesLibraryViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configure];
}

#pragma mark - Accessors

- (void)setModel:(TYVImagesLibraryModel *)model {
    if (_model != model) {
        _model = model;
        [self.rootView.contentCollectionView reloadData];
    }
}

#pragma mark - Private

- (void)configure {
    NSString *key = NSStringFromClass(TYVImagesLibraryItem.class);
    NSNib *nib = [[NSNib alloc] initWithNibNamed:key bundle:nil];
    [self.rootView.contentCollectionView registerNib:nib forItemWithIdentifier:key];
    
    [self.rootView configure];
    self.rootView.delegate = self;
}

#pragma mark - NSCollectionViewDataSource

- (NSInteger)collectionView:(NSCollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.model.count;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView
     itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    TYVImagesLibraryItem *item = [collectionView makeItemWithIdentifier:NSStringFromClass(TYVImagesLibraryItem.class)
                                                           forIndexPath:indexPath];
    
    [item fillWithModel:[self.model imageAtIndex:indexPath.item]];
    item.observer = self;
    
    return item;
}

#pragma mark - TYVImagesLibraryViewDelegate

- (void)insertImagesWithURLs:(NSArray<NSURL *> *)urls atPoint:(CGPoint)point indexPath:(NSIndexPath *)indexPath {
    for (NSURL *url in urls) {
        NSIndexPath *path = [NSIndexPath indexPathForItem:0 inSection:0];
        [self.model insertImageWithURL:url atIndex:0];
        [self.rootView.contentCollectionView insertItemsAtIndexPaths:[NSSet setWithArray:@[path]]];
    }
}

#pragma mark - TYVImagesLibraryItemObserver

- (void)doDoubleClick:(TYVImageModel *)model {
    [self.delegate showDetailImageWithModel:model];
}

@end
