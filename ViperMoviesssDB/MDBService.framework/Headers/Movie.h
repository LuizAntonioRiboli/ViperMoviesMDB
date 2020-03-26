//
//  Movie.h
//  MovieDbObjectiveC
//
//  Created by Anderson on 17/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie: NSObject
@property (nonatomic, copy)   NSString *posterPath;
@property (nonatomic, copy)   NSString *originalTitle;
@property (nonatomic, copy)   NSArray<NSNumber *> *genreIDS;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSNumber* voteAverage;
@property (nonatomic, copy)   NSString *overview;
@property (nullable, copy)    NSData *imageData;
@property (nonatomic, copy)   NSMutableArray<NSString *> *genreCategories;

- (instancetype)initWithTitle:(NSString *)title
                overview:(NSString *)overview
                posterPath:(NSString *)posterPath
                voteAverage:(NSNumber *)voteAverage;

@end

NS_ASSUME_NONNULL_END
