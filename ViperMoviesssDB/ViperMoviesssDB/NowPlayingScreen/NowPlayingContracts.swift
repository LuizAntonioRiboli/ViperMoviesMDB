//
//  NowPlayingContracts.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 20/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

//MARK: View -

/// NowPlaying Module View Protocol
protocol NowPlayingViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type NowPlayingEntity
    
    func showNowPlayingMovies(with: [GlobalMovie]?)
}

//MARK: Interactor -
/// NowPlaying Module Interactor Protocol
protocol NowPlayingInteractorProtocol {
    // Fetch Object from Data Layer
    var presenter: NowPlayingPresenterProtocol? {get set}
}

//MARK: Presenter -
/// NowPlaying Module Presenter Protocol
protocol NowPlayingPresenterProtocol {
    
    var interactor: NowPlayingInteractorProtocol? {get set}
    var view: NowPlayingViewProtocol? {get set}
    var wireframe: NowPlayingRouterProtocol? {get set}
    var movies: [GlobalMovie]? {get set}
    
    func viewDidLoad()
   
}

//MARK: Router (aka: Wireframe) -
/// NowPlaying Module Router Protocol
protocol NowPlayingRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: NowPlayingEntity, parentViewController viewController: UIViewController)
}
