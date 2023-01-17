//
//  TopHeadlinesRequest.swift
//  GetNews
//
//  Created by emre usul on 17.01.2023.
//

import Foundation

struct TopHeadlinesRequest: DataRequest {
    
    private let apiKey: String = "1c1848fcebe647799aa01baf7625e51f"
    private let country: String = "us"
    
    var url:String {
        let baseURL:String = "https://newsapi.org/v2"
        let path:String = "/top-headlines?"
        print(baseURL+path)
        return baseURL+path
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [
            "country":country,
            "apiKey":apiKey
            
        ]
        
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Article] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(NewsResponse.self, from: data)
        return response.articles
    }
    
    
}
