//
//  TYVImagesLibraryView.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVImagesLibraryView.h"

@interface TYVImagesLibraryView ()
@property (readonly) NSArray<NSString *>  *acceptableTypes;
@property (readonly) NSDictionary<NSPasteboardReadingOptionKey, id> *filteringOptions;

@end

@implementation TYVImagesLibraryView
@dynamic acceptableTypes;
@dynamic filteringOptions;

#pragma mark - Accessors

- (NSArray<NSString *> *)acceptableTypes {
    return @[NSURLPboardType];
}

- (NSDictionary<NSPasteboardReadingOptionKey, id> *)filteringOptions {
    return @{NSPasteboardURLReadingContentsConformToTypesKey : NSImage.imageTypes};
}

#pragma mark - Public

- (void)configure {
    [self registerForDraggedTypes:self.acceptableTypes];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    BOOL allow = [self shouldAllowDrag:sender];
    return allow ? NSDragOperationCopy : NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender {
    return [self shouldAllowDrag:sender];
}
\
- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    NSPasteboard *pasteBoard = sender.draggingPasteboard;
    CGPoint point = [self convertPoint:sender.draggingLocation fromView:nil];
    NSArray *urls = [pasteBoard readObjectsForClasses:@[NSURL.class] options:self.filteringOptions];
    
    return urls.count > 0;
}

#pragma mark - Private

- (BOOL)shouldAllowDrag:(id<NSDraggingInfo>)draggingInfo {
    BOOL canAccept = false;
    NSPasteboard *pasteBoard = draggingInfo.draggingPasteboard;
    if ([pasteBoard canReadObjectForClasses:@[NSURL.class]
                                    options:self.filteringOptions]) {
        canAccept = YES;
    }
    
    return canAccept;
}

@end
