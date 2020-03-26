//
//  NSObject+GenreService.h
//  MovieDbObjectiveC
//
//  Created by Anderson on 23/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Genre.h"
NS_ASSUME_NONNULL_BEGIN

@interface MDBGenreService: NSObject
+(MDBGenreService *) sharedInstance;
-(void) fetchAllGenres:(void(^)(NSMutableDictionary<NSNumber *, NSString *> *genres, NSError *error)) completionBlock;
@end

NS_ASSUME_NONNULL_END
