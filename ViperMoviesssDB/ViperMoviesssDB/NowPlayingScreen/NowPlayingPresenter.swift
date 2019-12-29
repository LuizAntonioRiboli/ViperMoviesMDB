//
//  NowPlayingPresenter.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 20/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// NowPlaying Module Presenter
class NowPlayingPresenter: NowPlayingPresenterProtocol {

    var view: NowPlayingViewProtocol?
    var interactor: NowPlayingInteractorProtocol?
    var wireframe: NowPlayingRouterProtocol?
    var movies: [GlobalMovie]?
    
    func viewDidLoad() {
        view?.showNowPlayingMovies(with: movies)
    }
    
    func showMovieDetails(with movie: GlobalMovie?, from view: UIViewController) {
        wireframe?.showMovieDetails(with: movie, from: view)
    }
}
