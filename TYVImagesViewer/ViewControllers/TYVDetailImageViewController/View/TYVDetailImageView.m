//
//  TYVDetailImageView.m
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 27.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVDetailImageView.h"

@implementation TYVDetailImageView

#pragma mark - First responder

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)becomeFirstResponder {
    return YES;
}

- (BOOL)resignFirstResponder {
    return YES;
}

- (void)keyUp:(NSEvent *)event {
    if (event.keyCode == 53) {
        [self.delegate didPressOnEsc:nil];
    }
}


@end
