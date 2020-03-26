//
//  NSObject+ImageLoaderService.h
//  MovieDbObjectiveC
//
//  Created by Anderson on 19/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDBImageLoaderService: NSObject
+(MDBImageLoaderService *) sharedInstance;
-(NSURLSessionDownloadTask*) fetchImageWithURL: (NSString *)path completionAction: (void(^)(NSData *data, NSError *error)) completionBlock;
@end

NS_ASSUME_NONNULL_END
