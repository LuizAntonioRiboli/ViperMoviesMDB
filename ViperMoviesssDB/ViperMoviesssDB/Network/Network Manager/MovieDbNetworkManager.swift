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
    
    func getPopularMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        
    }
    
    func getPlayingNowMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        
//        provider.request(.nowPlaying(page: page)) { (result) in
//            switch result{
//            case .success(let response):
//                do {
//                    let results = try JSONDecoder().decode(PopularMoviesResult.self, from: response.data)
//                    completion(.success(results.movies))
//                } catch let err {
//                    completion(.failure(err))
//                }
//            case .failure(let error):
//                 completion(.failure(error))
//            }
//        }
        
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
