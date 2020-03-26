//
//  NSObject+MSBNowPlayingMoviesService.h
//  MovieDbObjectiveC
//
//  Created by Anderson on 19/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDBNowPlayingMoviesService: NSObject
+(MDBNowPlayingMoviesService *) sharedInstance;

-(void) fetchNowPlayingMovies:(void(^)(NSMutableArray<Movie *> *moviesArray, NSError *error)) completionBlock;
@end

NS_ASSUME_NONNULL_END
