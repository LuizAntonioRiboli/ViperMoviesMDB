//
//  NSObject+MDBPopularMoviesService.h
//  MovieDbObjectiveC
//
//  Created by Anderson on 18/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDBPopularMoviesService: NSObject

+(MDBPopularMoviesService *) sharedInstance;

-(void) fetchPopularMovies:(void(^)(NSMutableArray<Movie *> *moviesArray, NSError *error)) completionBlock;
@end

NS_ASSUME_NONNULL_END
