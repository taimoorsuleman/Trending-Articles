//
//  MockAPIService.swift
//  CodingExerciseTests
//
//  Created by Taimoor Suleman on 18/10/2024.
//

import Foundation
@testable import TrendingArticles



final class MockAPIService:ArticleListWebServiceProtocol{
    
    var isError: Bool = false
    
    func getArticleList(timePeriod: Int) async throws -> TrendingArticles.ArticleListResponse {
        if isError{
            throw NetworkError.unableToComplete
        }else{
            return ArticleListResponse.mock
        }
    }
}
