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
#import "TYVMacro.h"

TYVViewControllerProperty(TYVImagesLibraryViewController, rootView, TYVImagesLibraryView)

@interface TYVImagesLibraryViewController () <NSCollectionViewDataSource, NSCollectionViewDelegate>
@property (nonatomic, strong)   NSArray<TYVImageModel *> *models;

@end

@implementation TYVImagesLibraryViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configurate];
}

#pragma mark - Private

- (void)configurate {
    NSString *key = NSStringFromClass(TYVImagesLibraryItem.class);
    NSNib *nib = [[NSNib alloc] initWithNibNamed:key bundle:nil];
    [self.rootView.contentCollectionView registerNib:nib forItemWithIdentifier:key];
    
    NSMutableArray *models = [NSMutableArray new];
    for (int i = 0; i < 50; i++) {
        TYVImageModel *model = [TYVImageModel new];
        [models addObject:model];
    }
    
    self.models = [models copy];
}

#pragma mark - NSCollectionViewDataSource

- (NSInteger)collectionView:(NSCollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.models.count;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView
     itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    TYVImagesLibraryItem *item = [collectionView makeItemWithIdentifier:NSStringFromClass(TYVImagesLibraryItem.class)
                                                           forIndexPath:indexPath];
    [item fillWithModel:self.models[indexPath.item]];
    
    return item;
}

@end
