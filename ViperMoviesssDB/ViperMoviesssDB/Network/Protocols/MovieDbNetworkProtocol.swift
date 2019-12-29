//
//  MovieDbNetworkProtocol.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 29/12/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

protocol MovieDbNetworkProtocol {
    
    
    func getPopularMovies(page: Int, completion: @escaping (Result<[Movie],Error>) -> Void)
    
    func getPlayingNowMovies(page: Int, completion: @escaping (Result<[Movie],Error>) -> Void)
}
