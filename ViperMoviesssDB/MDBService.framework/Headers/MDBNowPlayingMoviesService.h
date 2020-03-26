//
//  NSObject+MSBNowPlayingMoviesService.h
//  MovieDbObjectiveC
//
//  Created by Anderson on 19/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"


@interface MDBNowPlayingMoviesService: NSObject
+(MDBNowPlayingMoviesService *_Nonnull) sharedInstance;

-(void) fetchNowPlayingMovies:(void(^_Nonnull)(NSMutableArray<Movie *> * _Nonnull moviesArray, NSError * _Nullable error)) completionBlock;
@end


