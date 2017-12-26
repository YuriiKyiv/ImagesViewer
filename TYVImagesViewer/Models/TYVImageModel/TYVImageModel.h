//
//  TYVImageModel.h
//  TYVImagesViewer
//
//  Created by Yurii Trokhymchuk on 26.12.17.
//  Copyright © 2017 Yurii Trokhymchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString* TYVImageModelToken;
typedef void(^TYVImageModelCompletion)(NSImage *image, TYVImageModelToken token);

@interface TYVImageModel : NSObject
@property (readonly) NSImage    *image;
@property (readonly) NSURL      *url;

@property (readonly) TYVImageModelToken token;

+ (instancetype)modelWithURL:(NSURL *)url;
- (instancetype)initWithURL:(NSURL *)url;

- (void)getImageWithBlock:(TYVImageModelCompletion)completinBlock;

@end
