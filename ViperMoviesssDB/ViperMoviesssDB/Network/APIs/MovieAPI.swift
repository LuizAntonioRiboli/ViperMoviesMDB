//
//  MovieAPI.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 29/12/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import Moya

enum MovieApi {
    
    static private let apiKey = "e7874dc70ec5827126c27e68c1c85962"

    case popular(page:Int)
    case nowPlaying(page:Int)
}

extension MovieApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "now_playing"
        case .popular:
            return "popular"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .nowPlaying, .popular:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .nowPlaying, .popular:
            guard let param = parameters else {fatalError("Missing parameters")}
            
            let request = Task.requestParameters(parameters: param, encoding: parameterEncoding)
            
            return request
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
      return .successCodes
    }
}

//MARK: - Auxiliar Moya properties
extension MovieApi {
    var parameters: [String: Any]? {
        switch self {
        case .nowPlaying(let page), .popular(let page):
            return ["page":page,
                    "api_key": MovieApi.apiKey,
                    "language": "en-US"]
           
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .nowPlaying, .popular:
            return URLEncoding.queryString
        }
    }
}
