//
//  TopHeadlinesModel.swift
//  GetNews
//
//  Created by emre usul on 17.01.2023.
//

import Foundation

protocol TopHeadlinesViewModel: AnyObject {
    var news: [Article] { set get }
    var onFetchNewsSuccedd: (() -> Void)? { set get }
    var onFetchNewsFailure: ((Error) -> Void)? { set get}
    func fetchHeadlines()
    func numberOfRowsInSection() -> Int
}

final class TopHeadlinesDefaultViewModel: TopHeadlinesViewModel {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    var news: [Article] = []
    var onFetchNewsSuccedd: (() -> Void)?
    var onFetchNewsFailure: ((Error) -> Void)?
    
    func fetchHeadlines() {
        let request = TopHeadlinesRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let news):
                self?.news = news
                self?.onFetchNewsSuccedd?()
                
            case .failure(let error):
                self?.onFetchNewsFailure?(error)
            }
        
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return news.count
    }
    
}
