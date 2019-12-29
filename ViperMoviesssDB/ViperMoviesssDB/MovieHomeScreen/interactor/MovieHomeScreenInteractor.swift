//
//  MovieHomeScreenInteractor.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieHomeScreen Module Interactor
class MovieHomeScreenInteractor:  MovieHomeScreenInputInteractorProtocol{
    
    var presenter: MovieHomeScreenOutputInteractorProtocol?
    let moviesDbManager = MovieDbNetworkManager()
    
    func fetchPlayingNowMovies(page: Int) {
        
        moviesDbManager.getPlayingNowMovies(page: page) { result in
            switch result {
            case .success(let movies):
                var globalMovies = [GlobalMovie]()
                let downloadAlbumImagesGroup = DispatchGroup()
                
                for movie in movies {
                    downloadAlbumImagesGroup.enter()
                    
                    FetchMovieData.shared.fetchImage(posterPath: movie.posterPath, completion: { imageData in
                        
                        let movie = GlobalMovie(title: movie.title,
                                                overview: movie.overview,
                                                voteAverage: movie.voteAverage,
                                                albumImage: imageData)
                        globalMovies.append(movie)
                        
                        downloadAlbumImagesGroup.leave()
                    })
                }
                
                downloadAlbumImagesGroup.notify(queue: DispatchQueue.main){
                    print("Loaded all album images ")
                    self.presenter?.nowPlayingMoviesDidFetch(movies: globalMovies)
                }
                
            case .failure(let error): print(error)
            }
        }    
    }
    
    func fetchPopularMovies(page: Int) {
        
        moviesDbManager.getPopularMovies(page: page) { (result) in
            
            switch result{
            case .success(let movies):
                
                var globalMovies = [GlobalMovie]()
                let downloadAlbumImagesGroup = DispatchGroup()
                
                for movie in movies {
                    downloadAlbumImagesGroup.enter()
                    
                    FetchMovieData.shared.fetchImage(posterPath: movie.posterPath, completion: { imageData in
                        
                        let movie = GlobalMovie(title: movie.title,
                                                overview: movie.overview,
                                                voteAverage: movie.voteAverage,
                                                albumImage: imageData)
                        globalMovies.append(movie)
                        
                        downloadAlbumImagesGroup.leave()
                    })
                }
                
                downloadAlbumImagesGroup.notify(queue: DispatchQueue.main){
                    print("Loaded all album images ")
                    self.presenter?.popularMoviesDidFetch(movies: globalMovies)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
//        FetchPopularMovieData.shared.fetchData { (result) in
//            self.presenter?.popularMoviesDidFetch(movies: result)
//        }
    }
}
