//
//  MovieDbNetworkManager.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 29/12/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import Moya

struct MovieDbNetworkManager: MovieDbNetworkProtocol {
    
    let provider = MoyaProvider<MovieApi>()
    
    func getPopularMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        provider.request(.popular(page: page)) { result in
            switch result{
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(PopularMoviesResult.self, from: response.data)
                    
                    completion(.success(results.movies))
                
                } catch let err {
                    completion(.failure(err))
                    
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getPlayingNowMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        provider.request(.nowPlaying(page: page)) { (result) in
            switch result{
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(PopularMoviesResult.self, from: response.data)
                    completion(.success(results.movies))
                } catch let err {
                    completion(.failure(err))
                }
            case .failure(let error):
                 completion(.failure(error))
            }
        }
    }
}
