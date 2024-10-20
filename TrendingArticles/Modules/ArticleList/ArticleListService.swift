//
//  ArticleService.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import Foundation

protocol ArticleListWebServiceProtocol {
    func getArticleList(timePeriod: Int) async throws -> ArticleListResponse
}


final class ArticleService : ArticleListWebServiceProtocol{
    
    var networkManager: NetworkManager
    
    // MARK: -  Initialization
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    // MARK: - API METHOD

    
    func getArticleList(timePeriod:Int) async throws -> ArticleListResponse {
        let urlString = "\(APIConstants.apiBaseURL)\(EndPoints.artcleListEndpoint)/all-sections/\(timePeriod).json?api-key=\(APIConstants.apiKey)"
        guard let request = networkManager.createRequest(for: urlString) else {
            throw NetworkError.invalidURL
        }
        
        return try await networkManager.executeRequest(request: request)
    }
    
    
}
