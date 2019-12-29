//
//  FetchMovieData.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

final class FetchMovieData: FetchMovieDataProtocol {
    
    static let shared = FetchMovieData()
    
}

extension FetchMovieData: FetchImageDataProtocol {
    
//  Can return empty data, if returns empty data, set "could not load image"
    func fetchImage(posterPath: String,completion: @escaping (Data)->Void){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") else { return completion(Data())}
        
        URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let imageData = data else { return }
            completion(imageData)
           
            }.resume()
       
    }
}
