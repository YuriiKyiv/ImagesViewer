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
#import "TYVMacro.h"

TYVViewControllerProperty(TYVImagesLibraryViewController, rootView, TYVImagesLibraryView)

@interface TYVImagesLibraryViewController () <NSCollectionViewDataSource, NSCollectionViewDelegate>

@end

@implementation TYVImagesLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

#pragma mark - NSCollectionViewDataSource

- (NSInteger)collectionView:(NSCollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 25;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView
     itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    TYVImagesLibraryItem *item = [collectionView makeItemWithIdentifier:NSStringFromClass(TYVImagesLibraryItem.class)
                                                           forIndexPath:indexPath];
    
    return item;
}

@end
