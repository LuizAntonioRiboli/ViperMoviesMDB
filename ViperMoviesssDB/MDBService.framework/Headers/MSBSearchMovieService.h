//
//  NSObject+MovieSearchService.h
//  MovieDbObjectiveC
//
//  Created by Anderson on 24/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
NS_ASSUME_NONNULL_BEGIN

@interface MSBSearchMovieService: NSObject
+(MSBSearchMovieService *) sharedInstance;
-(void) fetchMoviesWithName:(NSString *)name completion: (void(^)(NSMutableArray<Movie *> *moviesArray, NSError *error)) completionBlock;
@end

NS_ASSUME_NONNULL_END
