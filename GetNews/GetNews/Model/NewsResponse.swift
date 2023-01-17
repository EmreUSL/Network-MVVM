//
//  NewsModel.swift
//  GetNews
//
//  Created by emre usul on 16.01.2023.
//

import Foundation

struct NewsResponse : Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
}

