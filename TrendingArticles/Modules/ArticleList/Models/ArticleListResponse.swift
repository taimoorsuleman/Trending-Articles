//
//  ArticleListResponse.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 19/10/2024.
//

//
//   let articleListResponse = try? JSONDecoder().decode(ArticleListResponse.self, from: jsonData)

import Foundation

// MARK: - ArticleListResponse
struct ArticleListResponse: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [ArticleModel]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    static let mock = ArticleListResponse(
        status: "ok",
        copyright: "© 2024 The New York Times Company. All Rights Reserved.",
        numResults: 10,
        results: [.mock,.mock,.mock,.mock,.mock,.mock,.mock,.mock,.mock,.mock]
    )
}






