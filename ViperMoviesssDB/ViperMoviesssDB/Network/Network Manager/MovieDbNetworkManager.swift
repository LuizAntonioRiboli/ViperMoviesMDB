//
//  MovieDbNetworkManager.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 29/12/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import Moya
import MDBService

struct MovieDbNetworkManager: MovieDbNetworkProtocol {
    
    let provider = MoyaProvider<MovieApi>()
    
    // Fetch Popular Movies using framework made in Obj-C
    func getPopularMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        MDBPopularMoviesService.sharedInstance().fetchPopularMovies { (popularMovies, error) in
            
            var movies = [Movie]()
            
            if (popularMovies.count > 0) {
                for case let movie as MDBService.Movie in popularMovies {
                    print(movie.title)
                    movies.append(Movie(voteCount: Int(truncating: movie.voteAverage),
                                        id: 0,
                                        video: false,
                                        voteAverage: Double(truncating: movie.voteAverage),
                                        title: movie.title,
                                        popularity: 0,
                                        posterPath: movie.posterPath,
                                        originalLanguage: "",
                                        originalTitle: movie.originalTitle,
                                        genreIDS: movie.genreIDS as! [Int],
                                        backdropPath: "",
                                        adult: false,
                                        overview: movie.overview,
                                        releaseDate: ""))
                }
                
                completion(.success(movies))
            } else {
                completion(.failure(error))
            }
        }
        
    }
    
    // Fetch Now Playing Movies using framework made in Obj-C
    func getPlayingNowMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        MDBNowPlayingMoviesService.sharedInstance().fetchNowPlayingMovies { nowPlayingMovies, error in
            
            var movies = [Movie]()
            
            if (nowPlayingMovies.count > 0) {
                for case let movie as MDBService.Movie in nowPlayingMovies{
                    print(movie.title)
                    movies.append(Movie(voteCount: Int(truncating: movie.voteAverage),
                                        id: 0,
                                        video: false,
                                        voteAverage: Double(truncating: movie.voteAverage),
                                        title: movie.title,
                                        popularity: 0,
                                        posterPath: movie.posterPath,
                                        originalLanguage: "",
                                        originalTitle: movie.originalTitle,
                                        genreIDS: movie.genreIDS as! [Int],
                                        backdropPath: "",
                                        adult: false,
                                        overview: movie.overview,
                                        releaseDate: ""))
                }
                
                completion(.success(movies))
            } else {
                completion(.failure(error))
            }
        }
    }
}
